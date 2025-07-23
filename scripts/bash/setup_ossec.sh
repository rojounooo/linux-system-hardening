#!/bin/bash

# Setup OSSEC HIDS
# Requires sudo/root privileges

OSSEC_VERSION="3.7.0"
OSSEC_DIR="/var/ossec"
EMAIL_TO="you@example.com"
SMTP_SERVER="localhost"

echo "[*] Updating system and installing prerequisites..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y libz-dev libssl-dev libpcre2-dev build-essential libsystemd-dev curl

echo "[*] Downloading OSSEC v$OSSEC_VERSION..."
cd /tmp
curl -LO https://github.com/ossec/ossec-hids/archive/${OSSEC_VERSION}.tar.gz

echo "[*] Extracting OSSEC..."
tar -zxvf ${OSSEC_VERSION}.tar.gz
cd ossec-hids-${OSSEC_VERSION}

echo "[*] Running OSSEC installer with predefined answers..."
sudo ./install.sh <<EOF
local
$OSSEC_DIR
$EMAIL_TO
y
y
y
y
EOF

echo "[*] Starting OSSEC service..."
sudo ${OSSEC_DIR}/bin/ossec-control start

echo "[*] Configuring email notifications in ossec.conf..."
OSSEC_CONF="${OSSEC_DIR}/etc/ossec.conf"

sudo sed -i '/<global>/,/<\/global>/ s/<email_notification>no<\/email_notification>/<email_notification>yes<\/email_notification>/g' $OSSEC_CONF
sudo sed -i "/<global>/,/<\/global>/ a \    <email_to>$EMAIL_TO</email_to>\n    <smtp_server>$SMTP_SERVER</smtp_server>" $OSSEC_CONF

echo "[*] Restarting OSSEC to apply changes..."
sudo ${OSSEC_DIR}/bin/ossec-control restart

echo "[*] Enabling OSSEC to start on boot..."
sudo systemctl enable ossec

echo "[*] Setup complete. Monitoring alerts log:"
echo "    tail -f ${OSSEC_DIR}/logs/alerts/alerts.log"
