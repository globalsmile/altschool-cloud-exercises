# Vagrant Ubuntu Cluster with LAMP Stack Deployment

## Overview

This repository contains a bash script for the automated deployment of a Vagrant-based Ubuntu cluster with a LAMP stack. The deployment includes a 'Master' node for control and a 'Slave' node managed by the Master. The script also handles user management, SSH key-based authentication, data transfer, process monitoring, and LAMP stack deployment on both nodes.

## Prerequisites

- Vagrant installed
- SSH keys set up for passwordless authentication
- Clean Vagrantfile for Master and Slave nodes
- Basic understanding of Linux, Vagrant, and LAMP stack components

## Instructions

1. Clone the Repository:
```
git clone <repository-url>
cd <repository-directory>
```

2. Make Script Executable:
```
chmod +x deploy.sh
```

3. Execute the Deployment Script:
```
./deploy.sh
```
The script will deploy Master, Slave and Load balancer nodes, configure user management, enable SSH key-based authentication, transfer data, display process overview, and install the LAMP stack.

## Directory Structure

- /mnt/altschool/: Directory on the Master node containing data to be transferred to the Slave node.

- /mnt/altschool/slave/: Target directory on the Slave node for data transfer.

- index.php: A test PHP page to validate the LAMP setup on Master and Slave nodes.
