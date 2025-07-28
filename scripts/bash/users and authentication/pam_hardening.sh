#!/bin/bash

set -e

echo "[+] Starting PAM hardening..."

# Timestamp for backups
TS=$(date +%Y%m%d_%H%M%S)

# File paths
PAM_FILE="/etc/pam.d/common-password"
LOGIN_DEFS="/etc/login.defs"

# === BACKUP SECTION ===
echo "[0/4] Backing up configuration files..."
for FILE in "$PAM_FILE" "$LOGIN_DEFS"; do
    if [ -f "$FILE" ]; then
        BACKUP="${FILE}.bak-${TS}"
        sudo cp "$FILE" "$BACKUP"
        echo "[-] Backed up $FILE -> $BACKUP"
    else
        echo "[!] WARNING: $FILE not found — skipping backup"
    fi
done

# === Enhance PAM password hashing ===

echo "[1/4] Updating PAM password hashing settings..."

if grep -q "pam_unix.so.*yescrypt" "$PAM_FILE"; then
    echo "[+] Detected yescrypt — setting rounds=65536"
    sudo sed -i 's|^\(.*pam_unix.so.*yescrypt\).*|password [success=1 default=ignore] pam_unix.so obscure yescrypt rounds=65536|' "$PAM_FILE"
elif grep -q "pam_unix.so.*sha512" "$PAM_FILE"; then
    echo "[+] Detected sha512 — setting rounds=100000"
    sudo sed -i 's|^\(.*pam_unix.so.*sha512\).*|password [success=1 default=ignore] pam_unix.so obscure sha512 rounds=100000|' "$PAM_FILE"
else
    echo "[-] WARNING: pam_unix.so line with yescrypt or sha512 not found in $PAM_FILE"
fi

# === Set password aging policies ===

echo "[2/4] Configuring password aging policies..."

sudo sed -i 's/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   60/' "$LOGIN_DEFS" || echo "PASS_MAX_DAYS   60" | sudo tee -a "$LOGIN_DEFS"
sudo sed -i 's/^PASS_MIN_DAYS.*/PASS_MIN_DAYS   7/' "$LOGIN_DEFS" || echo "PASS_MIN_DAYS   7" | sudo tee -a "$LOGIN_DEFS"
sudo sed -i 's/^PASS_WARN_AGE.*/PASS_WARN_AGE   14/' "$LOGIN_DEFS" || echo "PASS_WARN_AGE   14" | sudo tee -a "$LOGIN_DEFS"

# === Install and configure pam_pwquality ===

echo "[3/4] Installing and configuring pam_pwquality..."
sudo apt update -y
sudo apt install libpam-pwquality -y

# Add or modify pam_pwquality line
if grep -q "pam_pwquality.so" "$PAM_FILE"; then
    sudo sed -i '/pam_pwquality.so/ c\password requisite pam_pwquality.so retry=3 minlen=12 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1' "$PAM_FILE"
else
    echo "password requisite pam_pwquality.so retry=3 minlen=12 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1" | sudo tee -a "$PAM_FILE"
fi

# === Set stricter umask ===

echo "[4/4] Setting stricter default umask..."
sudo sed -i 's/^UMASK.*/UMASK 027/' "$LOGIN_DEFS" || echo "UMASK 027" | sudo tee -a "$LOGIN_DEFS"

echo "umask 027" | sudo tee /etc/profile.d/umask.sh > /dev/null
sudo chmod +x /etc/profile.d/umask.sh

echo "[✓] PAM hardening complete."
echo "⚠️  Backups saved with timestamp: $TS"
echo "⚠️  Please test changes with a non-critical user before applying system-wide."
