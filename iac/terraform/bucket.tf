resource "google_storage_bucket" "static-site" {
  project                     = var.gcp_project_id
  name                        = "mlspec-volumetry"
  location                    = "EUROPE-WEST1"
  force_destroy               = false
  uniform_bucket_level_access = true
  storage_class               = "REGIONAL"

}