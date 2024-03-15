variable "project_id" {
  description = "project id"
  type        = string
}

variable "registry_location" {
  description = "image location"
  type        = string
  default     = "us"
}

variable "default_region" {
  description = "default region"
  type        = string
  default     = "us-west1"

}

variable "github_org" {
  description = "github organization"
  type        = string
}

variable "repository" {
  description = "github repository"
  type        = string
}

variable "triggers" {
  description = "build triggers"
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
  description = "docker image name"
  type        = string
}

variable "artifact_repo_name" {
  description = "artifact repository name"
  type        = string
}

variable "dockerfile_path" {
  description = "dockerfile path"
  type        = string
  default     = "Dockerfile"
}

variable "cloudbuild_file" {
  description = "cloudbuild file"
  type        = string
  default     = "cloudbuild.yaml"
}

variable "name_prefix" {
  description = "cloud run service name prefix"
  type        = string
  default     = ""
}

variable "service_regions" {
  description = "regions to push images to"
  type        = string
}

variable "gke_cluster" {
  description = "gke cluster"
  type        = string
  default     = ""
}