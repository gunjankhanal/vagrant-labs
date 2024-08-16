#!/bin/bash

sudo apt-get install -y build-essential linux-headers-$(uname -r)

vagrant plugin install vagrant-vbguest
vagrant up
