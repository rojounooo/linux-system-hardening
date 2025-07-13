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

    # 🛑 Privilege & Access Restrictions
    NoNewPrivileges=true                      # Prevents privilege escalation
    CapabilityBoundingSet=CAP_DAC_READ_SEARCH CAP_SETUID CAP_SETGID CAP_CHOWN CAP_FOWNER
    RestrictSUIDSGID=true                     # Disallows setuid/setgid binaries
    UMask=0027                                # Ensures secure file creation (640 files, 750 dirs)

    # 📁 Filesystem Protections
    PrivateTmp=true                           # Isolates temp directories
    ProtectSystem=strict                      # Mounts /usr, /boot, and /etc as read-only
    ProtectHome=true                          # Blocks access to /home, /root, and /run/user

    # 🧠 Kernel & Device Isolation  
    ProtectKernelTunables=true                # Prevents tampering with kernel settings
    ProtectKernelModules=true                 # Blocks loading/unloading of kernel modules
    ProtectControlGroups=true                 # Restricts cgroup manipulation
    PrivateDevices=true                       # Creates an isolated /dev environment

    # 🔒 Namespace & Syscall Restrictions
    RestrictNamespaces=uts ipc pid user cgroup # Blocks risky namespace creation
    SystemCallFilter=@system-service          # Whitelists safe system calls

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
