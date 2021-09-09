resource "google_container_registry" "registry" {
  project  = "mlteam-ml-specialization-2021"
  location = "EU"

  depends_on = [
    google_project_service.container_registry_api,
  ]
}
