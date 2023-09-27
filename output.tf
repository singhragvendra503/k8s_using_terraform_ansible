output "master_public_IP" {
  value = google_compute_instance.master.network_interface.0.access_config.0.nat_ip
}
output "worker_public_IP" {
  value = google_compute_instance.worker[*].network_interface.0.access_config.0.nat_ip
}