resource "google_cloudbuild_trigger" "github_filename_trigger" {
  for_each = var.triggers
  provider = google-beta
  project  = var.project_id
  name     = "${lower(var.artifact_repo_name)}-${each.key}"
  location = var.default_region
  filename = each.value["filename"]

  # Second Gen Trigger Type
  repository_event_config {
    repository = "projects/${var.project_id}/locations/${var.default_region}/connections/${var.github_org}/repositories/${var.github_org}-${var.repository}"

    push {
      branch       = each.value.branch
      invert_regex = false
    }
  }

  substitutions = {
    _ARTIFACT_REPO_NAME = var.artifact_repo_name
    _IMAGE_NAME         = var.image_name
    _BUILD_PATH         = var.build_path
    _DOCKERFILE         = var.dockerfile
    _REGISTRY_LOCATION  = var.registry_location
    _REGION_NAME        = var.default_region
    _SERVICE_NAME       = "${var.name_prefix}-cr"
    _GKE_CLUSTER        = var.gke_cluster
  }
}

resource "google_artifact_registry_repository" "repo" {
  location      = var.registry_location
  repository_id = var.artifact_repo_name
  description   = "${var.artifact_repo_name} ${var.github_org}/${var.repository}"
  format        = "DOCKER"
}