#!/bin/bash

DB_USER="sonar"
DB_PASS="sonar"
DB_NAME="sonarqube"

# Update the System
sudo apt -y update
sudo apt -y upgrade

## Add PostgresSQL repository
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null



## Install PostgreSQL
sudo apt update
sudo apt-get -y install postgresql postgresql-contrib
sudo systemctl enable postgresql

## Create Database for Sonarqube
echo "postgres:postgres@12345" | sudo chpasswd

sudo -u postgres psql <<EOF
CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASS';
CREATE DATABASE $DB_NAME OWNER $DB_USER;
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOF

## Add Adoptium repository
sudo bash
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list

## Install Java 17
sudo apt update
sudo apt install temurin-17-jdk
sudo update-alternatives --config java
/usr/bin/java --version
exit 