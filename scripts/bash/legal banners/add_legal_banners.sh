#!/bin/bash
set -e

# === Banner Message ===
BANNER_MESSAGE="********************************************************************
* WARNING: Unauthorized access to this system is prohibited.       *
* This system is for the use of authorized users only.             *
* Individuals using this system without authority, or in excess    *
* of their authority, are subject to having all their activities   *
* on this system monitored and recorded by system personnel.       *
* Anyone using this system expressly consents to such monitoring.  *
* If such monitoring reveals evidence of criminal activity, such   *
* evidence may be provided to law enforcement officials.           *
********************************************************************"

# === Backup ===
echo "[*] Backing up existing /etc/issue and /etc/issue.net"
sudo cp /etc/issue /etc/issue.bak
sudo cp /etc/issue.net /etc/issue.net.bak

# === Apply Banner ===
echo "[*] Applying banner to /etc/issue and /etc/issue.net"
echo "$BANNER_MESSAGE" | sudo tee /etc/issue > /dev/null
echo "$BANNER_MESSAGE" | sudo tee /etc/issue.net > /dev/null

# === SSH Config Update ===
SSH_CONFIG="/etc/ssh/sshd_config"
echo "[*] Configuring SSH to use /etc/issue.net as banner"
if grep -q "^Banner" "$SSH_CONFIG"; then
    sudo sed -i "s|^Banner.*|Banner /etc/issue.net|" "$SSH_CONFIG"
else
    echo "Banner /etc/issue.net" | sudo tee -a "$SSH_CONFIG" > /dev/null
fi

# === Restart SSH ===
echo "[*] Restarting SSH service"
sudo systemctl restart sshd

# === Done ===
echo "[✓] Banner applied successfully and SSH configured."
