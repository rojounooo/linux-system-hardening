# 🛡️ dbus Service Hardening Guide

This guide outlines best practices for securing the `dbus.service` unit using systemd sandboxing features and capability restrictions to reduce its attack surface.

## 🔧 Steps to Harden dbus

### 1. Open the systemd override editor
```bash
sudo systemctl edit dbus.service
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
PrivateDevices=true

# 🔒 Namespace & Syscall Restrictions
RestrictNamespaces=uts pid user cgroup

```

### 3. Reload and restart 
 ```bash 
    sudo systemctl daemon-reexec
    sudo systemctl restart dbus.service
```

### 4. Verify changes 
```bash 
    systemd-analyze security dbus.service
``` 
