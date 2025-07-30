#!/bin/bash 
set -e

# === debsums implementation ===

echo "Installing debsums..."    
sudo apt install debsums -y

echo "Verifying installed packages..."
sudo debsums -y

# === Patch Management Visibility ===

echo "Installing show-versions"
sudo apt install apt-show-versions -y

echo "Displaying available package versions"
apt-show-versions | grep upgradeable

# === Monitoring bugs and changes ===

echo "Installing listbugs and listchanges"
sudo apt install apt-listbugs apt-listchanges -y

# === Removing unused packages ===
echo "Removing unused packages..."
sudo apt autoremove -y
