variable "master_machine_type" {
  type = string
  default = "e2-medium"
}
variable "worker_machine_type" {
  type = string
  default = "e2-micro"
}
variable "region" {
  type = string
  default = "us-west1"
}
variable "zone" {
  type = string
  default = "us-west1-a"
}
variable "iso_image_name" {
  type = string
  default = "ubuntu-os-cloud/ubuntu-2204-lts"
}
variable "subnet_ip_cidr_range" {
    type = string
    default = "10.0.1.0/24"
}

