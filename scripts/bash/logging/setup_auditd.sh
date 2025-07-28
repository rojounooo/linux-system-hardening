#!/bin/bash

# This script sets up auditd on a Linux system.

echo "Updating package lists..."
sudo apt update -y 

echo "Installing auditd..."
sudo apt install auditd audispd-plugins -y

echo "Enabling and starting auditd service..."
sudo systemctl enable auditd
sudo systemctl start auditd

echo "Verifying auditd status..."
sudo systemctl status auditd

echo "Auditd setup completed successfully."
echo "You can configure audit rules in /etc/audit/audit.rules or using auditctl command."
