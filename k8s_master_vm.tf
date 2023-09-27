resource "google_compute_instance" "master" {
  name         = "k8s-master"
  machine_type = var.master_machine_type
  zone         = var.zone
  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
  
  tags = ["demo", "k8s-master"]

  boot_disk {
    initialize_params {
      image = var.iso_image_name
      size  = 20
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
