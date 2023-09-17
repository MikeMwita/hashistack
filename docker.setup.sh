#!/bin/bash

# Update system and all dependencies required
sudo apt update

# install required packages to allow apt to use a repository over HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add docker’s official GPG key

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add docker official repository
echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update and Install docker and other services

sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Add current user to docker group to allow running docker without sudo

sudo usermod -aG docker ${USER}

# Enable Docker to start on boot
sudo systemctl enable docker