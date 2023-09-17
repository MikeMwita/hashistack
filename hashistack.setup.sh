#!/bin/bash

# Update system and all dependencies required
sudo apt-get update && sudo apt-get install wget gpg coreutils

# Add the HashiCorp GPG key

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the official HashiCorp Linux repository

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update and install (for OSS Consul binary)

sudo apt-get update && sudo apt-get install nomad consul

# Enable consul and nomad

sudo systemctl enable consul nomad