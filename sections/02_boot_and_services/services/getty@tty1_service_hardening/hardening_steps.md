# 🛡️ getty@tty1 Service Hardening Guide

This guide outlines best practices for securing the `getty@tty1.service` unit using systemd sandboxing features and capability restrictions to reduce its attack surface.

## 🔧 Steps to Harden getty@tty1

### 1. Open the systemd override editor
```bash
sudo systemctl edit getty@tty1.service
``` 
### 2. Add hardening directives 
```bash 
[Service]

# 🛑 Privilege & Access Restrictions
NoNewPrivileges=yes
RestrictSUIDSGID=true

# 📁 Filesystem Protections
PrivateTmp=true
ProtectSystem=strict
ProtectHome=true

# 🧠 Kernel & Device Isolation
ProtectKernelTunables=true
ProtectKernelModules=true
ProtectControlGroups=true

```

### 3. Reload and restart 
 ```bash 
    sudo systemctl daemon-reexec
    sudo systemctl restart getty@tty1.service
```

### 4. Verify changes 
```bash 
    systemd-analyze security getty@tty1.service
``` 
