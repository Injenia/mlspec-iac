resource "google_compute_instance" "api-testing-vm" {
  project = var.gcp_project_id

  name         = "api-testing-vm"
  machine_type = "e2-standard-4"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-pro-cloud/ubuntu-pro-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  allow_stopping_for_update = true

  service_account {
    email  = google_service_account.api-testing-account.email
    scopes = ["cloud-platform"] # https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes
  }

  depends_on = [
    google_project_service.compute_engine_api,
  ]
}
