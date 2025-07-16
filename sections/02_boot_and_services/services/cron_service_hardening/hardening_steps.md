# 🛡️ Cron Service Hardening Guide

This guide outlines best practices for securing the `crond.service` unit using systemd sandboxing features and capability restrictions to reduce its attack surface.

## 🔧 Steps to Harden Cron

### 1. Open the systemd override editor
```bash
sudo systemctl edit cron.service
``` 
### 2. Add hardening directives 
```bash 
[Service]
# Run cron in foreground
ExecStart=
ExecStart=/bin/bash -c 'umask 0027 && exec /usr/sbin/cron -f' # Foregrounds cron.service and forces it to use umask 0027

# 🛑 Privilege & Access Restrictions
NoNewPrivileges=yes
UMask=0027
CapabilityBoundingSet=CAP_DAC_READ_SEARCH CAP_SETUID CAP_SETGID CAP_CHOWN CAP_FOWNER
RestrictSUIDSGID=true

# 📁 Filesystem Protections
PrivateTmp=true
ProtectSystem=strict
ProtectHome=true

# 🧠 Kernel & Device Isolation
ProtectKernelTunables=true
ProtectKernelModules=true
ProtectControlGroups=true
PrivateDevices=true

# 🔒 Namespace & Syscall Restrictions
RestrictNamespaces=uts ipc pid user cgroup
SystemCallFilter=@system-service


```

### 3. Reload and restart 
 ```bash 
    sudo systemctl daemon-reexec
    sudo systemctl restart cron.service
```

### 4. Verify changes 
```bash 
    systemd-analyze security cron.service
``` 
