#!/bin/bash

echo "============================="
echo " INSTALL WORDPRESS"
echo "============================="
echo

sudo apt-get install apache2 php php-mysql
sudo apt-get install mysql-server

echo "=============================>"
echo "Downloading Data"
echo "=============================>"
cd
rm -f latest.zip
wget https://wordpress.org/latest.zip

echo "=============================>"
echo "Ekstrak File"
echo "=============================>"
sudo apt-get install unzip
sudo unzip latest.zip
echo "=============================>"
echo "Memindahkan data"
echo "=============================>"
sudo rm -R /var/www/html/*
sudo rm -f /var/www/html/*
cd   wordpress
sudo cp -r * /var/www/html
echo "=============================>"
echo "Setup selesai"
echo "=============================>"
echo "=============================>"
echo "Config Database"
echo "=============================>"

sudo mysql -u root -e "create database wordpress";

sudo mysql -u root wordpress < /var/www/html/dump.sq;

sudo mysql -u root -e "create user 'wordpress'@'%' identified by 'password'";

sudo mysql -u root -e "grant all privileges on *.* to 'wordpress'@'%'";

echo "=============================>"
echo "DONE"
echo "=============================>"
