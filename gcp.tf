provider "google" {
  credentials = file("/config/api-exercise.json")
  project     = var.project
  region      = var.region
}
