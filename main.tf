resource "google_cloudbuild_trigger" "github_filename_trigger" {
  for_each = var.triggers
  provider = google-beta
  project  = var.project_id
  name     = "${lower(var.repository)}-${each.key}"
  location = var.region
  filename = each.value.filename

  # Second Gen Trigger Type
  repository_event_config {
    repository = "projects/${var.project_id}/locations/${var.region}/connections/${var.github_org}/repositories/${var.github_org}-${var.repository}"

    push {
      branch       = each.value.branch
      invert_regex = false
    }
  }

  substitutions = {
    _ARTIFACT_REPO_NAME = var.artifact_repo_name
    _IMAGE_NAME         = var.image_name
    _DOCKERFILE_PATH    = var.dockerfile_path
    _REGION_NAME        = var.region
    _SERVICE_NAME       = var.service_name
    _GKE_CLUSTER        = var.gke_cluster
  }
}

resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = var.image_name
  description   = "${var.github_org}/${var.repository} docker repository"
  format        = "DOCKER"
}