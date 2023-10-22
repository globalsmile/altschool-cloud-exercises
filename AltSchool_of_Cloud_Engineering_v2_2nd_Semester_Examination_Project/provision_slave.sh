#!/bin/bash

# Update and upgrade
sudo apt-get update
sudo apt-get upgrade -y

# Execute master provisioning script on slave
wget https://raw.githubusercontent.com/globalsmile/altschool-cloud-exercises/master/AltSchool_of_Cloud_Engineering_v2_2nd_Semester_Examination_Project/provision_master.sh
chmod +x provision_master.sh
./provision_master.sh

# Create cron job for checking uptime at 12 am
(crontab -l ; echo "0 0 * * * /usr/bin/uptime >> /var/log/uptime.log") | crontab -

