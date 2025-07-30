# 🛡️ fwupd Service Hardening Guide

This guide outlines best practices for securing the `fwupd.service` unit using systemd sandboxing features and capability restrictions to reduce its attack surface.

## 🔧 Steps to Harden fwupd

### 1. Open the systemd override editor
```bash
sudo systemctl edit fwupd.service
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

# 🔒 Namespace & Syscall Restrictions
RestrictNamespaces=uts pid ipc user cgroup

```

### 3. Reload and restart 
 ```bash 
    sudo systemctl daemon-reexec
    sudo systemctl restart fwupd.service
```

### 4. Verify changes 
```bash 
    systemd-analyze security fwupd.service
``` 
