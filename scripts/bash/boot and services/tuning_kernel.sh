#!/bin/bash

set -e

CONFIG_FILE="/etc/sysctl.d/99-hardening.conf"
BACKUP_FILE="${CONFIG_FILE}.bak"

# Backup existing configuration if it exists
if [ -f "$CONFIG_FILE" ]; then
  echo "Backing up existing sysctl config to $BACKUP_FILE"
  sudo cp "$CONFIG_FILE" "$BACKUP_FILE"
fi

# Write the Lynis recommended kernel hardening settings to the sysctl file
sudo tee "$CONFIG_FILE" > /dev/null <<EOF
######################################
# Kernel Hardening settings recommended by Lynis
######################################

dev.tty.ldisc_autoload = 0
fs.protected_fifos = 2
fs.protected_symlinks = 1
fs.protected_hardlinks = 1
fs.suid_dumpable = 0
kernel.core_uses_pid = 1
kernel.kptr_restrict = 2
kernel.modules_disabled = 1
kernel.perf_event_paranoid = 3
kernel.sysrq = 0
kernel.unprivileged_bpf_disabled = 1
kernel.randomize_va_space = 2

net.core.bpf_jit_harden = 2
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.default.log_martians = 1
EOF

# Apply the new sysctl settings
echo "Applying sysctl settings..."
sudo sysctl --system

# Notify the user
echo "Kernel parameters have been tuned and applied successfully."

# Verify the changes
echo "Current kernel parameters:"
sudo sysctl -a | grep -E 'dev.tty.ldisc_autoload|fs.protected|fs.suid_dumpable|kernel.core_uses_pid|kernel.kptr_restrict|kernel.modules_disabled|kernel.perf_event_paranoid|kernel.sysrq|kernel.unprivileged_bpf_disabled|kernel.randomize_va_space|net.core.bpf_jit_harden|net.ipv4.conf.all.accept_redirects|net.ipv4.conf.all.log_martians|net.ipv4.conf.all.rp_filter|net.ipv4.conf.all.send_redirects|net.ipv4.conf.default.accept_redirects|net.ipv4.conf.default.accept_source_route|net.ipv4.conf.default.log_martians'

echo "Tuning complete. Please review the settings above."
