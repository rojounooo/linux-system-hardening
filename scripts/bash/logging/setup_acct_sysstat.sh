#!/bin/bash
set -e

# This script sets up the sysstat package for system performance monitoring and acct package for process accounting. 

echo "Updating package lists..."
sudo apt update -y 

echo "Installing sysstat and acct packages..."
sudo apt install -y sysstat acct

echo "Starting and enabling acct service..."
sudo systemctl start acct # Starts the service
sudo systemctl enable acct # Enables the service at boot

echo "Checking acct service status..."
sudo systemctl status acct

echo "Starting and enabling sysstat service..."
sudo systemctl start sysstat # Starts the service
sudo systemctl enable sysstat # Enables the service at boot

echo "Checking sysstat service status..."
sudo systemctl status sysstat


echo "Enabling sysstat data collection..."
sudo sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat

echo "Restarting sysstat service to apply changes..."
sudo systemctl restart sysstat

echo "Sysstat and acct setup completed successfully."
echo "You can now monitor system performance and process accounting."
echo "Use 'sar' command for sysstat and 'lastcomm' for acct to view data."