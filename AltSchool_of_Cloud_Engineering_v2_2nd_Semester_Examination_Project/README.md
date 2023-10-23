# Vagrant LAMP Stack Automation

This repository contains scripts and configurations to automate the provisioning of two Ubuntu-based servers, "Master" and "Slave," using Vagrant. The Master node is configured with a LAMP (Linux, Apache, MySQL, PHP) stack using a bash script, and the Slave node is provisioned using Ansible.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Vagrant Setup](#vagrant-setup)
- [Provisioning Scripts](#provisioning-scripts)
- [Ansible Playbook](#ansible-playbook)
- [Verification](#verification)
- [Documentation](#documentation)
- [Submission](#submission)

## Prerequisites

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)
- [Git](https://git-scm.com/)

## Vagrant Setup

1. Install Vagrant, VirtualBox, and Git on your local machine.

2. Clone this repository:

   ```bash
   git clone https://github.com/globalsmile/altschool-cloud-exercises.git
   cd AltSchool_of_Cloud_Engineering_v2_2nd_Semester_Examination_Project


3. Start Vagrant
```
vagrant up
```

## Provisioning Scripts

### Master Node

The bash script `provision_master.sh` is responsible for setting up the LAMP stack on the Master node. It performs the following tasks:

- Updates and upgrades the system.
- Installs Apache, MySQL, PHP, and other necessary packages.
- Clones a PHP application from the Laravel GitHub repository.
- Configures Apache for the Laravel application.
- Configures MySQL for the Laravel application.

### Slave Node

The bash script `provision_slave.sh` executes the master provisioning script on the Slave node and performs additional tasks:

- Verifies the accessibility of the PHP application.
- Creates a cron job to check the server's uptime every day at midnight.

![IMG_0181](https://github.com/globalsmile/altschool-cloud-exercises/assets/106287208/e6c7e84c-0ea3-40dc-a35e-dce80994f94b)

![IMG_0182](https://github.com/globalsmile/altschool-cloud-exercises/assets/106287208/d42d333b-813d-45dd-bc4a-2f00d613a555)

### Ansible Playbook
The Ansible playbook `ansible_playbook.yml` is used to execute the master provisioning script on the Slave node:

```ansible-playbook ansible_playbook.yml```

## Verification

After provisioning the Slave node, the PHP application's accessibility is verified by making an HTTP request to the application's URL. The verification process is automated in the `provision_slave.sh` script.

![IMG_0183](https://github.com/globalsmile/altschool-cloud-exercises/assets/106287208/6119d1b0-0be9-4482-9469-bac76404f4e6)

![IMG_0184](https://github.com/globalsmile/altschool-cloud-exercises/assets/106287208/887963c9-a61e-4fa9-82bb-bbbb4481c943)





