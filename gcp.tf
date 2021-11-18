 provider "google" {
   credentials = file("/config/api-exercise.json")
   project     = var.project
   region      = var.region
 }

#provider "google" {
#  credentials = file("/home/pulse/gke/api-exercise.json")
#  project     = var.project
#  region      = var.region
#}

terraform {
  backend "gcs" {
    credentials = "/config/api-exercise.json"
    bucket = "qaztf-state-prod"
    prefix = "qazterraform/state"
  }
}
