#!/bin/bash
sudo dnf -y update
sudo dnf -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload

