# Hashi Stack Setup (Consul, Vault, Nomad)

sudo apt-get update && \
  sudo apt-get install wget gpg coreutils

## Add the HashiCorp GPG key

    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

    or

    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

    

## Add the official HashiCorp Linux repository

    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

    or

    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"


    

## Update and install (for OSS Consul binary)

    sudo apt-get update && sudo apt-get install nomad consul

    or 
    
    sudo apt update && sudo apt install consul nomad


## Update and install. (for OSS Nomad binary)

    sudo apt update && sudo apt install nomad

## Update and install. (for OSS Vault binary)

    sudo apt update && sudo apt install vault

## Enable consul, vault and nomad

    sudo systemctl enable consul nomad vault

## Stop consul, vault and nomad

    sudo systemctl stop consul
    sudo systemctl stop vault
    sudo systemctl stop nomad

## Start consul, vault and nomad

    sudo systemctl start consul
    sudo systemctl start vault
    sudo systemctl start nomad

## Status consul, vault and nomad

    sudo systemctl status consul
    sudo systemctl status vault
    sudo systemctl status nomad

## Nomad configs Container Network Interface (cni) configs

Download the latest copy

    curl -L -o cni-plugins.tgz https://github.com/containernetworking/plugins/releases/download/v0.8.1/cni-plugins-linux-amd64-v0.8.1.tgz
    curl -L -o cni-plugins.tgz https://github.com/containernetworking/plugins/releases/download/v0.8.1/cni-plugins-linux-amd64-v0.8.1.tgz
    curl -L -o cni-plugins.tgz https://github.com/containernetworking/plugins/releases/download/v1.1.0/cni-plugins-linux-amd64-v1.1.0.tgz

## Nomad configs Container Network Interface (cni) configs  
    curl -L -o cni-plugins.tgz https://github.com/containernetworking/plugins/releases/download/v1.3.0/cni-plugins-linux-amd64-v1.3.0.tgz

Install cni on a specific path

    sudo mkdir -p /opt/cni/bin
    sudo tar -C /opt/cni/bin -xzf cni-plugins.tgz

Configure Nomad Clients by adding below

    client {
        enabled = true

        network_interface = "{{ GetPrivateInterfaces | include \"network\" \"10.0.0.0/8\" | attr \"name\" }}"

        # Add support for cni
        cni_path = "/opt/cni/bin"

        # Add support for cni config
        #cni_config_dir = "/etc/cni/net.d"

        # Managing volume mounts

        host_volume "nocodb_data" {
            path      = "/opt/data/nocodb"
            read_only = false
        }

        host_volume "nocodb_db" {
            path      = "/opt/data/nocodb/db"
            read_only = false
        }
    }
