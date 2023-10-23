#!/bin/bash

# Update and upgrade
sudo apt-get update
sudo apt-get upgrade -y

# Install LAMP stack
sudo apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql

# Clone PHP application
git clone https://github.com/laravel/laravel.git /var/www/html/laravel

# Configure Apache
sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/laravel.conf
sudo sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/laravel\/public/' /etc/apache2/sites-available/laravel.conf
sudo a2ensite laravel
sudo a2enmod rewrite
sudo systemctl restart apache2

# Configure MySQL
sudo mysql_secure_installation <<EOF
n
password
password
y
y
y
y
EOF
sudo mysql -u root -e "CREATE DATABASE laravel;"
sudo mysql -u root -e "CREATE USER 'laravel'@'localhost' IDENTIFIED BY 'sample_password';"
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON laravel.* TO 'laravel'@'localhost';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"
sudo mysql -u root -e "EXIT;"
