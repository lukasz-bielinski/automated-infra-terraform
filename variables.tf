variable "project" {
  default = "api-exercise-236915"
}

variable "region" {
  default = "us-central1"
}

variable "cluster_name" {
  # default = "api-cluster-1"
}

variable "cluster_k8s_version" {
  # default = "1.21.5-gke.1302"
}

variable "initial_node_count" {
  default = 1
}

variable "autoscaling_min_node_count" {
  default = 1
}

variable "autoscaling_max_node_count" {
  # default = 30
}

variable "disk_size_gb" {
  default = 30
}

variable "disk_type" {
  default = "pd-standard"
}

variable "machine_type" {
  # default = "e2-medium"
}
