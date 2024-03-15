# terraform-module-cloudbuild-artifact
create cloudbuild triggers and artifact registry repository in gcp

A terraform module to provide a cloudbuild trigger and artifact registry repository

Module Input Variables
----------------------

- `project_id` - GCP project id
- `region` - Region
- `github_org` - Github Organization name
- `repository` - Github Repository name
- `triggers` - Branches to trigger docker builds on
- `image_name` - Optional: Docker Image name
- `artifact_repo_name` - Optional: Artifact Registry repository name
- `dockerfile_path` - Optional: Dockerfile location
- `cloudbuild_file` - Optional: Cloudbuild.yaml file location/name
- `name_prefix` - Optional: Cloudrun Service name prefix
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
  name_prefix        = local.name_prefix
}
```

Outputs
=======


Development
=======

Thise repo uses `cz`[https://github.com/semantic-release/commit-analyzer/] to manage semantic versioning. Please use the following set of commands to initialize your development environment and commit changes:

```asdf install
npm install
npm install -g commitizen
git add *
git cz```

Authors
=======

drew.mercer@brandlive.com
