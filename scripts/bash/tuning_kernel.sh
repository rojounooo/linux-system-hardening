#!/bin/bash

set -e

CONFIG_FILE="/etc/sysctl.d/99-tuning.conf"
BACKUP_FILE="${CONFIG_FILE}.bak"

# Backup existing configuration if it exists
if [ -f "$CONFIG_FILE" ]; then
  echo "Backing up existing sysctl config to $BACKUP_FILE"
  sudo cp "$CONFIG_FILE" "$BACKUP_FILE"
fi

# Write the hardened configuration to the sysctl file
sudo tee "$CONFIG_FILE" > /dev/null <<EOF
####################################
# Networking Hardening - IPv4
####################################

# Disable IP forwarding
net.ipv4.ip_forward = 0

# Disable sending and accepting ICMP redirects
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0

# Disable source-routed packets
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0

# Enable logging of suspicious ("martian") packets
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1

# Enable SYN cookies to protect against SYN flood attacks
net.ipv4.tcp_syncookies = 1

# Enable reverse path filtering (anti-spoofing)
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Ignore broadcast ICMP echo requests (prevents Smurf attacks)
net.ipv4.icmp_echo_ignore_broadcasts = 1

# Ignore bogus ICMP error responses
net.ipv4.icmp_ignore_bogus_error_responses = 1

####################################
# Networking Hardening - IPv6
####################################

# Disable IPv6 if not in use
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1

# Disable IPv6 redirects
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0

# Disable source route in IPv6
net.ipv6.conf.all.accept_source_route = 0
net.ipv6.conf.default.accept_source_route = 0

####################################
# Kernel Hardening
####################################

# Restrict kernel pointer exposure
kernel.kptr_restrict = 2

# Enable full ASLR (Address Space Layout Randomization)
kernel.randomize_va_space = 2

# Increase minimum PID number space
kernel.pid_max = 65536

####################################
# Memory Protection
####################################

# Prevent mmap'ing low memory addresses (helps prevent NULL dereference exploits)
vm.mmap_min_addr = 65536

####################################
# File System Hardening
####################################

# Protect against symlink attacks
fs.protected_symlinks = 1

# Protect against hardlink attacks
fs.protected_hardlinks = 1
EOF

# Apply the new sysctl settings
sudo sysctl --system

# Notify the user
echo "Kernel parameters have been tuned and applied successfully."

# Verify the changes
echo "Current kernel parameters:"
sudo sysctl -a | grep -E 'ip_forward|accept_redirects|source_route|log_martians|tcp_syncookies|rp_filter|icmp|kptr|randomize_va_space|protected|mmap_min_addr|pid_max|disable_ipv6'
echo "Tuning complete. Please review the settings above."
####################################