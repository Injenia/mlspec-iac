resource "google_cloudbuild_trigger" "backend_trigger" {
  project = var.gcp_project_id
  name    = "be-volumetry-trigger"

  github {
    owner = "SGINJ"
    name  = "mlspec-be-volumetry"
    push {
      branch = "main"
    }
  }

  filename = "/ci/yaml/cloudbuild.yaml"

  depends_on = [
    google_project_service.cloud_build_api,
  ]
}
