#!/bin/bash

# remove all traces of nomad and consul via snap
sudo snap remove nomad consul

# purge all traces of consul and nomad via snap
sudo snap purge nomad consul

# purge all traces of nomad consul via apt
sudo apt purge nomad consul

# remove hashicorp gpg key
sudo rm -rvf /usr/share/keyrings/hashicorp-archive-keyring.gpg

# remove hashicorp repository from sources
sudo rm -rvf /etc/apt/sources.list.d/hashicorp.list

# do clen update and upgrade accordingly
sudo apt update && sudo apt upgrade
