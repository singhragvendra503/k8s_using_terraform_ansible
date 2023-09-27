resource "google_compute_instance" "worker" {
  name         = "k8s-worker-${count.index}"
  machine_type = var.worker_machine_type
  zone         = var.zone
  count = 2
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
  
  tags = ["demo", "k8s-worker"]

  boot_disk {
    initialize_params {
      image = var.iso_image_name
      size  = 10
      labels = {
        my_label = "value"
      }
    }
  }
  network_interface {
    network    = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.default.self_link
    access_config {
    }
  }
}