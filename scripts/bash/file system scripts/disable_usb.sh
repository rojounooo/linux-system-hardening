#!/bin/bash

# Block USB storage modules on Ubuntu
# Requires sudo/root privileges

BLACKLIST_FILE="/etc/modprobe.d/disable-usb-storage.conf"
UMS_BLACKLIST_FILE="/etc/modprobe.d/disable-ums.conf"

echo "[*] Creating blacklist for usb-storage..."
cat <<EOF | sudo tee $BLACKLIST_FILE >/dev/null
# Disable USB storage devices
blacklist usb-storage
install usb-storage /bin/true
EOF

echo "[*] Creating blacklist for ums-* drivers..."
cat <<EOF | sudo tee $UMS_BLACKLIST_FILE >/dev/null
# Disable additional USB mass storage drivers
blacklist ums-alauda
blacklist ums-cypress
blacklist ums-datafab
blacklist ums-eneub6250
blacklist ums-freecom
blacklist ums-isd200
blacklist ums-jumpshot
blacklist ums-karma
blacklist ums-onetouch
blacklist ums-sddr09
blacklist ums-sddr55
blacklist ums-usbat
EOF

echo "[*] Unloading usb-storage module if loaded..."
sudo modprobe -r usb-storage 2>/dev/null && echo "[-] usb-storage unloaded" || echo "[!] usb-storage not loaded"

echo "[*] Updating initramfs..."
sudo update-initramfs -u

echo "[*] Done. USB storage drivers are now blacklisted."
echo "[*] Reboot required for changes to take full effect."
# Note: This script will prevent USB storage devices from being used.
# If you need to re-enable them, remove the blacklist files and update initramfs again.
# Use with caution, especially on systems that rely on USB storage devices for booting or recovery.
# Always ensure you have alternative access methods to your system before applying such changes.