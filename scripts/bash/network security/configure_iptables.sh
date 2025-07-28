#!/bin/bash 

set -e # Exit immediately if a command exits with a non-zero status

# === Flush iptables rules ===

sudo iptables -F

# === Set default policies ===
sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT ACCEPT

# === Allow Loopback interface ===
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

# === Allow established and related connections ===
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# === Allow SSH ===
sudo iptables -A INPUT -p tcp --dport 2222 -j ACCEPT # Edit for custom port

# === Save iptables rules ===
sudo apt install iptables-persistent
sudo netfilter-persistent save

echo "Verify rules using `sudo iptables -L -n -v`"
