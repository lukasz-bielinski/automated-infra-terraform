resource "google_container_cluster" "cluster" {
  name                     = var.cluster_name
  location                 = var.region
  min_master_version       = var.cluster_k8s_version
  remove_default_node_pool = true
  initial_node_count       = 1

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }

    network_policy_config {
      disabled = false
    }

    http_load_balancing {
      disabled = false
    }


  }

  # network_policy {
  #   enabled  = true
  #   provider = "CALICO" // CALICO is currently the only supported provider
  # }
}

resource "google_container_node_pool" "preemptible_nodes" {
  cluster            = google_container_cluster.cluster.name
  name               = "preemptible-nodes"
  location           = var.region
  initial_node_count = var.initial_node_count

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = var.autoscaling_min_node_count
    max_node_count = var.autoscaling_max_node_count
  }

  node_config {
    image_type   = "cos_containerd"
    preemptible  = true
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type

    machine_type = var.machine_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/compute",
    ]


  }
}

#
# Output for K8S
#
# output "client_certificate" {
#   value     = "${google_container_cluster.cluster.master_auth.0.client_certificate}"
#   sensitive = true
# }
#
# output "client_key" {
#   value     = "${google_container_cluster.cluster.master_auth.0.client_key}"
#   sensitive = true
# }
#
# output "cluster_ca_certificate" {
#   value     = "${google_container_cluster.cluster.master_auth.0.cluster_ca_certificate}"
#   sensitive = true
# }
#
# output "host" {
#   value     = "${google_container_cluster.cluster.endpoint}"
#   sensitive = true
# }
