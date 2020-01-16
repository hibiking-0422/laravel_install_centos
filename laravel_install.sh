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

#mysql install
sudo yum remove mariadb-libs
sudo rm -rf /var/lib/mysql
rpm -ivh https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm
sudo yum install -y mysql-community-server
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service

#composer
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

#laravel install
sudo yum install -y zip unzip

#create test_app
cd
mkdir workspace
cd workspace
sudo composer create-project laravel/laravel laravel
cd laravel
php artisan serve --host 0.0.0.0
