# terraform-module-cloudbuild-artifact
create cloudbuild triggers and artifact registry repository in gcp

A terraform module to provide a cloudbuild trigger and artifact registry repository

Module Input Variables
----------------------

- `project_id` - GCP project id
- `region` - Region
- `github_org` - Github organization name
- `repository` - Github repository name
- `triggers` - Branches to trigger docker builds on
- `image_name` - Optional: Docker image name
- `artifact_repo_name` - Optional: Artifact registry repository name
- `dockerfile_path` - Optional: Dockerfile location
- `cloudbuild_file` - Optional: Cloudbuild.yaml file location/name
- `service_name` - Optional: Cloudrun service name
- `gke_cluster` - Optional: GKE Cluster 

Usage
-----

```hcl
module "cloudbuild" {
  source = "github.com/brandlive1941/terraform-gcp/modules/cloudbuild_repository"

  project_id         = var.project_id
  github_org         = var.github_org
  repo_name          = var.repository
  image_name         = local.image
  artifact_repo_name = local.artifact
  dockerfile_path    = var.dockerfile_path
  service_name       = local.service
}
```

Outputs
=======


Authors
=======

drew.mercer@brandlive.com
