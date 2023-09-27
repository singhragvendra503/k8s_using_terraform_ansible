resource "google_compute_subnetwork" "default" {
  name          = "k8s-subnet"
  ip_cidr_range = var.subnet_ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.self_link
}