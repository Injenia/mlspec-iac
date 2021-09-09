terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.72.0"
    }
  }

  backend "gcs" {
    bucket = "mlspec-iac"
    prefix = "terraform/develop/state"
  }
}

# Project level info
data "google_project" "project" {
  project_id = var.gcp_project_id
}

# Enables the Cloud Run API
resource "google_project_service" "run_api" {
  project                    = var.gcp_project_id
  service                    = "run.googleapis.com"
  disable_on_destroy         = true
  disable_dependent_services = true
}

resource "google_project_service" "container_registry_api" {
  project            = var.gcp_project_id
  service            = "containerregistry.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "cloud_build_api" {
  project            = var.gcp_project_id
  service            = "cloudbuild.googleapis.com"
  disable_on_destroy = true
}

resource "google_project_service" "compute_engine_api" {
  project            = var.gcp_project_id
  service            = "compute.googleapis.com"
  disable_on_destroy = true
}

