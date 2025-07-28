#!/bin/bash

# === Set target directory ===
TARGET_DIR="./baseline_config"

# === Updated list of services ===
SERVICES=(
    "cron.service"
    "dbus.service"
    "getty@tty1.service"
    "journald.service"
    "logind.service"
    "ModemManager.service"
    "multipathd.service"
    "networkd.service"
    "polkit.service"
    "resolved.service"
    "rsyslog.service"
    "ssh.service"
    "timesyncd.service"
    "udev.service"
    "udisks2.service"
    "unattended-upgrades.service"
    "user@1000.service"
    "fwupd.service"
    "upower.service"
)

# === Function to collect systemd unit files and drop-ins ===
collect_service_config() {
    SERVICE=$1
    SERVICE_DIR="$TARGET_DIR/$SERVICE"
    mkdir -p "$SERVICE_DIR"

    echo "Saving unit file for $SERVICE..."
    systemctl cat $SERVICE > "$SERVICE_DIR/original.conf" 2>/dev/null

    # Save drop-ins if any
    DROPIN_DIR="/etc/systemd/system/$SERVICE.d"
    if [ -d "$DROPIN_DIR" ]; then
        echo "Saving drop-ins for $SERVICE..."
        cp -r "$DROPIN_DIR" "$SERVICE_DIR/"
    fi
}

# === Function to collect daemon-specific configs ===
collect_daemon_config() {
    case $1 in
        cron.service)
            cp /etc/default/cron "$TARGET_DIR/cron.service/cron_default.conf" 2>/dev/null
            cp /etc/crontab "$TARGET_DIR/cron.service/crontab.conf" 2>/dev/null
            ;;
        ssh.service)
            cp /etc/ssh/sshd_config "$TARGET_DIR/ssh.service/sshd_config.conf" 2>/dev/null
            ;;
        rsyslog.service)
            cp /etc/rsyslog.conf "$TARGET_DIR/rsyslog.service/rsyslog.conf" 2>/dev/null
            ;;
        unattended-upgrades.service)
            cp /etc/apt/apt.conf.d/50unattended-upgrades "$TARGET_DIR/unattended-upgrades.service/50unattended-upgrades.conf" 2>/dev/null
            ;;
        fwupd.service)
            if [ -d /etc/fwupd ]; then
                cp -r /etc/fwupd "$TARGET_DIR/fwupd.service/fwupd_dir" 2>/dev/null
            fi
            if [ -f /etc/fwupd.conf ]; then
                cp /etc/fwupd.conf "$TARGET_DIR/fwupd.service/fwupd.conf" 2>/dev/null
            fi
            ;;
        upower.service)
            if [ -d /etc/UPower ]; then
                cp -r /etc/UPower "$TARGET_DIR/upower.service/UPower_dir" 2>/dev/null
            fi
            if [ -f /etc/UPower.conf ]; then
                cp /etc/UPower.conf "$TARGET_DIR/upower.service/UPower.conf" 2>/dev/null
            fi
            ;;
    esac
}

# === Main loop ===
for SERVICE in "${SERVICES[@]}"; do
    echo "Processing $SERVICE..."
    collect_service_config "$SERVICE"
    collect_daemon_config "$SERVICE"
done

echo "✅ Baseline configs saved to $TARGET_DIR"
