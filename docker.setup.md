
# Before installing docker spin below to be able to run

    sudo ip link add name docker0 type bridge &&
    sudo ip addr add dev docker0 172.17.0.1/16

# Uninstall old versions

Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:

 sudo apt-get remove docker docker-engine docker.io containerd runc

# Install using the repository

Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.

## Set up the repository

Update the apt package index and install packages to allow apt to use a repository over HTTPS:

    sudo apt-get update

    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

## Add Docker’s official GPG key

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

### Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels

Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.

     echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

## Install Docker Engine

Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version:

    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io -y

## Verify that Docker Engine is installed correctly by running the hello-world image

    sudo docker run hello-world

## Setting up docker-compose

FBR4DaxJvb23vM1r5aOLa3sySnCKl

### Step 2 — Executing the Docker Command Without Sudo (Optional)

If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:

    sudo usermod -aG docker ${USER}

To apply the new group membership, log out of the server and back in, or type the following:

    su - ${USER}

Confirm that your user is now added to the docker group by typing:
    groups

If you need to add a user to the docker group that you’re not logged in as, declare that username explicitly using:

    sudo usermod -aG docker username