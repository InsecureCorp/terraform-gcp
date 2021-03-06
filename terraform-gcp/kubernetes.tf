# tfsec:ignore:GCP009: test comment
resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location 	     = data.google_compute_zones.available.names[0]
  initial_node_count = 3

  min_master_version = var.kubernetes_version
  node_version       = var.kubernetes_version

  node_locations = [
    data.google_compute_zones.available.names[1],
  ]

  master_auth {
    username = var.username
    password = var.password
  }

  node_config {
    # tfsec:ignore:AVD-GCP-0050
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      
    ]
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "primary_zone" {
  value = google_container_cluster.primary.zone
}

output "additional_zones" {
  value = google_container_cluster.primary.additional_zones
}

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "node_version" {
  value = google_container_cluster.primary.node_version
}
