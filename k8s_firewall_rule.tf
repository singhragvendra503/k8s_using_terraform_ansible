resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "6443", "80", "443", "30001"]
  }
  priority      = "999"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_self" {
  name    = "allow-self"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "all"
  }
  priority      = "999"
  source_ranges = ["${google_compute_subnetwork.default.ip_cidr_range}"]
}