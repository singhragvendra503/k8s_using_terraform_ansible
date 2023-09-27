#!/bin/bash

# Get the public IP addresses of the virtual machines
instance1_public_ip=$(terraform output master_public_IP)
worker_public_ips=$(terraform output -json worker_public_IP)

# Check if jq is available
if command -v jq &> /dev/null; then
  # Use jq to parse the JSON array and extract individual IP addresses
  instance2_public_ip=$(echo "$worker_public_ips" | jq -r '.[0]')
  instance3_public_ip=$(echo "$worker_public_ips" | jq -r '.[1]')
else
  echo "jq is not installed. Please install jq to parse JSON data."
  exit 1
fi
instance1_public_ip="${instance1_public_ip//\"}"

# Generate the inventory
sudo cat <<EOF| sudo tee /etc/ansible/hosts
[all:vars]
ansible_user=ubuntu

[master]
$instance1_public_ip

[worker]
$instance2_public_ip
$instance3_public_ip
EOF