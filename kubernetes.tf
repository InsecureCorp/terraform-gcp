data "google_compute_zones" "available" {
}

# tfsec:ignore:GCP009: test comment
resource "google_container_cluster" "primary" {
  name           = var.cluster_name
  location 	     = "us-central1"
  initial_node_count = 1

  min_master_version = var.kubernetes_version
  node_version       = var.kubernetes_version

  monitoring_service = "monitoring.googleapis.com/kubernetes"

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
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

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "node_version" {
  value = google_container_cluster.primary.node_version
}
