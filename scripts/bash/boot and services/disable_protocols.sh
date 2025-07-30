#!/bin/bash

set -e 

# Define the blacklist file
BLACKLIST_FILE="/etc/modprobe.d/disable_protocols.conf"

# Create or overwrite the blacklist config file
cat <<EOF > "$BLACKLIST_FILE"
blacklist dccp
blacklist sctp
blacklist rds
blacklist tipc

install dccp /bin/true
install sctp /bin/true
install rds /bin/true
install tipc /bin/true
EOF

echo "[+] Blacklist file created at $BLACKLIST_FILE"

# Update initramfs
echo "[+] Updating initramfs..."
sudo update-initramfs -u

echo "[✓] Done. Reboot to apply changes."
