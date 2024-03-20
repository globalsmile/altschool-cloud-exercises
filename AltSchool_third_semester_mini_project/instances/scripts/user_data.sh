#!/bin/bash

# Update package lists
sudo apt-get update

# Install dependencies
sudo apt-get install -y software-properties-common

# Install Ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

# Install Docker
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# Add user to the docker group to run Docker commands without sudo
sudo usermod -aG docker $USER

# Start Docker service
sudo systemctl start docker

