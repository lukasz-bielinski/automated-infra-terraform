provider "google" {
  credentials = "${file("/home/pulse/gke/api-exercise.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}
