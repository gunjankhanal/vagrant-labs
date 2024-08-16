#!/bin/bash

sudo dnf -y update
sudo dnf -y install wget
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.2/node_exporter-1.8.2.linux-amd64.tar.gz
tar xvfz node_exporter-1.8.2.linux-amd64.tar.gz
cd node_exporter-1.8.2.linux-amd64

sudo firewall-cmd --permanent --add-port=9100/tcp
sudo firewall-cmd --reload

./node_exporter &
