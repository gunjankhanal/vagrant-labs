#!/bin/bash
sudo dnf -y update
sudo dnf -y install httpd
sudo systemctl enable httpd
sudo systemctl start httpd
# sudo firewall-cmd --permanent --add-service=httpd
# sudo firewall-cmd --reload