variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "github_org" {
  type = string
}

variable "repository" {
  type = string
}

variable "triggers" {
  type = map(object({
    branch   = string
    filename = string
  }))
  default = {
    dev = {
      branch   = "dev"
      filename = "cloudbuild.yaml"
    }
  }
}

variable "image_name" {
  type = string
}

variable "artifact_repo_name" {
  type = string
}

variable "dockerfile_path" {
  type    = string
  default = "Dockerfile"
}

variable "cloudbuild_file" {
  type    = string
  default = "cloudbuild.yaml"
}

variable "service_name" {
  type    = string
  default = ""
}

variable "gke_cluster" {
  type    = string
  default = ""
}