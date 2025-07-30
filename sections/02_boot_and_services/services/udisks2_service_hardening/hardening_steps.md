# 🛡️ udisks2 Service Hardening Guide

This guide outlines best practices for securing the `udisks2.service` unit using systemd sandboxing features and capability restrictions to reduce its attack surface.

## 🔧 Steps to Harden udisks2

### 1. Open the systemd override editor
```bash
sudo systemctl edit udisks2.service
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

# 🔒 Namespace & Syscall Restrictions
RestrictNamespaces=uts ipc pid user cgroup

```

### 3. Reload and restart 
 ```bash 
    sudo systemctl daemon-reexec
    sudo systemctl restart udisks2.service
```

### 4. Verify changes 
```bash 
    systemd-analyze security udisks2.service
``` 
