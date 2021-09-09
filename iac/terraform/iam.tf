# Grant roles to cloud build SA
resource "google_project_iam_binding" "cloud_run_admin" {
  project = data.google_project.project.number
  role    = "roles/run.admin"
  members = [
    "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "sa_act_as" {
  project = data.google_project.project.number
  role    = "roles/iam.serviceAccountUser"
  members = [
    "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com",
  ]
}


# VM for API call SA
resource "google_service_account" "api-testing-account" {
  project      = var.gcp_project_id
  account_id   = "api-testing-account"
  display_name = "api-testing-account"
}

resource "google_project_iam_binding" "api-testing-account-roles-cloudrun" {
  project = data.google_project.project.number
  role    = "roles/run.invoker"
  members = [
    "serviceAccount:${google_service_account.api-testing-account.email}",
  ]

}

resource "google_storage_bucket_iam_member" "api-testing-account-gcs-reader" {
  bucket = google_storage_bucket.static-site.name
  role   = "roles/storage.objectViewer"

  member = "serviceAccount:${google_service_account.api-testing-account.email}"

}
