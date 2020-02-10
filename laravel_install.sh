#!/bin/bash


#update & install
sudo yum -y update
sudo yum -y install vim

#httpd install
sudo yum -y install httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

#php install
sudo  yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo yum install -y --enablerepo=remi,remi-php72 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt php-mysqlnd
sudo systemctl restart httpd.service

#node.js install
curl -sL https://rpm.nodesource.com/setup_8.x | sudo bash -
sudo yum -y install nodejs

#mysql install
sudo yum -y remove mariadb-libs
sudo rm -rf /var/lib/mysql
rpm -ivh https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm
sudo yum install -y mysql-community-server
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service

#composer
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer global require "laravel/installer"

#laravel install
sudo yum install -y zip unzip
sudo yum install -y --enablerepo=remi-php72 php-zip


#create test_app
cd
mkdir workspace
cd workspace
sudo composer create-project laravel/laravel laravel
cd laravel
php artisan serve --host 0.0.0.0
