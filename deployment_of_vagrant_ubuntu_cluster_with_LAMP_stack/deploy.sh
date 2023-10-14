#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display error messages
error()
{
	echo "Error: $1" >&2
	exit 1
}

# Function to display success messages
success()
{
	echo "Success: $1"
}

# Check if the script is executed with root privileges
if [[ $EUID -ne 0 ]]; then
	error "This script must be run as root."
fi

# Function to execute commands on the Master node via SSH
ssh_master()
{
	ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null altschool@192.168.35.105 "$1"
}
# Function to ssh into the Slave node from the Master node
ssh_slave()
{
	ssh_master "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null altschool@192.168.35.106 \"$1\""
}

# Deploy Master and Slave nodes
# ssh_master "su - altschool; vagrant up"
vagrant up master
vagrant ssh master
vagrant up slave
vagrant ssh slave
# ssh_slave "su - altschool; vagrant up"

# Create user altschool on the Master node
ssh_master "sudo adduser altschool --gecos '' --disabled-password"
ssh_master "sudo usermod -aG sudo altschool"
ssh_master "echo 'altschool:password' | sudo chpasswd"

# Enable SSH key-based authentication
ssh_master "ssh-keygen -t rsa -b 2048"
ssh_slave "mkdir -p /home/altschool/.ssh"
ssh_master "cat ~/.ssh/id_rsa.pub" | ssh_slave "cat >> /home/altschool/.ssh/authorized_keys"

# Copy contents of /mnt/altschool directory to Slave node
ssh_master "rsync -avz /mnt/altschool/ altschool@192.168.35.106:/mnt/altschool/slave/"

# Display overview of Linux process management on Master node
ssh_master "ps aux"

# Install LAMP stack on both nodes
# Master node
echo "Configuring Master Node..."

ssh_master "sudo apt-get update && sudo apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql"
ssh_master "sudo systemctl enable apache2 && sudo systemctl start apache2"
ssh_master "sudo mysql_secure_installation <<EOF
n
password
password
y
y
y
y
EOF"

# Slave node
echo "Configuring Slave Node..."

ssh_slave "sudo apt-get update && sudo apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql"
ssh_slave "sudo systemctl enable apache2 && sudo systemctl start apache2"
ssh_slave "sudo mysql_secure_installation <<EOF
n
password
password
y
y
y
y
EOF"

# Validate PHP functionality with Apache
echo "<?php phpinfo(); ?>" > index.php
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null index.php altschool@192.168.35.105:/var/www/html/
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null index.php altschool@192.168.35.106:/var/www/html/

success "Deployment completed successfully."
