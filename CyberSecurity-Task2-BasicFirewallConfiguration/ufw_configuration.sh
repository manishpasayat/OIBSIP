#!/bin/bash

echo "Enabling UFW..."

sudo ufw --force enable

echo "Applying firewall rules..."

sudo ufw allow ssh
sudo ufw deny http
sudo ufw allow https
sudo ufw deny 23

echo "Current Firewall Status"

sudo ufw status verbose
