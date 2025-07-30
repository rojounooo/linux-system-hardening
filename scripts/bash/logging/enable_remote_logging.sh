#!/bin/bash

set -e

CONFIG_FILE="/etc/rsyslog.conf"
BACKUP_FILE="${CONFIG_FILE}.bak"
REMOTE_HOST_IP="192.168.1.100"  # Replace with your remote syslog server IP or hostname

# Ensure rsyslog is installed
echo "Installing rsyslog..."
sudo apt update
sudo apt install -y rsyslog

# Backup existing rsyslog config
if [ -f "$CONFIG_FILE" ]; then
  echo "Backing up existing rsyslog config to $BACKUP_FILE"
  sudo cp "$CONFIG_FILE" "$BACKUP_FILE"
fi

# Append remote logging configuration if not already present
if ! grep -q "@@${REMOTE_HOST_IP}:514" "$CONFIG_FILE"; then
  echo "Configuring rsyslog to forward all logs to $REMOTE_HOST_IP:514 via TCP"
  echo "*.* @@${REMOTE_HOST_IP}:514" | sudo tee -a "$CONFIG_FILE"
fi

# Enable TCP module if not already enabled
if ! grep -q 'module(load="imtcp")' "$CONFIG_FILE"; then
  echo "Enabling TCP input module in rsyslog config"
  sudo tee -a "$CONFIG_FILE" > /dev/null <<EOF

# Enable TCP syslog reception
module(load="imtcp")
input(type="imtcp" port="514")
EOF
fi

# Restart rsyslog service
echo "Restarting rsyslog..."
sudo systemctl restart rsyslog

# Notify the user
echo "rsyslog has been configured to forward logs to $REMOTE_HOST_IP on TCP port 514."
