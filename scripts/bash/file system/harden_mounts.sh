#!/bin/bash
set -e

# === CONFIG ===

# Define the disks to be partitioned and formatted
# Adjust these as per your system's configuration
HOME_DISK="/dev/sdb" 
VAR_DISK="/dev/sdc"
TMP_DISK="/dev/sdd"

# === FUNCTIONS ===
partition_and_format() {
    local disk=$1
    local mountpoint=$2
    local opts=$3

    echo "[*] Partitioning $disk..."
    echo -e "n\np\n1\n\n\nw" | fdisk $disk

    PART="${disk}1"
    echo "[*] Formatting $PART as ext4..."
    mkfs.ext4 $PART

    echo "[*] Mounting temporarily to /mnt..."
    mount $PART /mnt

    echo "[*] Migrating data from $mountpoint..."
    rsync -a $mountpoint/ /mnt/

    echo "[*] Updating fstab for $mountpoint..."
    UUID=$(blkid -s UUID -o value $PART)
    echo "UUID=$UUID  $mountpoint  ext4  defaults,$opts  0 2" >> /etc/fstab

    echo "[*] Unmounting /mnt..."
    umount /mnt

    echo "[*] Mounting $mountpoint..."
    mount $mountpoint
}

# === MAIN ===
echo "=== Setting up /home ==="
partition_and_format $HOME_DISK "/home" "nodev,nosuid,noexec"

echo "=== Setting up /var ==="
partition_and_format $VAR_DISK "/var" "nodev,nosuid"

echo "=== Setting up /tmp ==="
partition_and_format $TMP_DISK "/tmp" "nodev,nosuid,noexec"

echo "=== Reloading mounts ==="
mount -a

echo "=== Reloading systemd daemon ==="
systemctl daemon-reload

echo "[✔] All done. Verify with: df -h"

