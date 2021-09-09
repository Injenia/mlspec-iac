resource "google_cloud_run_service" "be_volumetry" {
  project  = data.google_project.project.number
  name     = "cloudrun-be-volumetry"
  location = "europe-west1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
        resources {
          limits = {
            cpu    = "2000m"
            memory = "2048Mi"
          }
          requests = {
            cpu    = "1000m"
            memory = "1024Mi"
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [
    google_project_service.run_api,
  ]

}
