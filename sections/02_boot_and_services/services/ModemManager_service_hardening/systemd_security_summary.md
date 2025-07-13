# Systemd Security Summary – `ModemManager.service`

## Exposure Level

| Stage      | Exposure Score |
|------------|----------------|
| Baseline   |      6.3       |
| Hardened   |                |

---

## Key Security Options

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✓ |          | Service processes cannot change the system clock |
| NoNewPrivileges= | ✓ |          | Service processes cannot acquire new privileges |
| AmbientCapabilities= | ✓ |          | Service process does not receive ambient capabilities |
| PrivateDevices= | ✗ |          | Service potentially has access to hardware devices |
| ProtectClock= | ✗ |          | Service may write to the hardware clock or system clock |
| ProtectKernelLogs= | ✗ |          | Service may read from or write to the kernel log ring buffer |
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_BPF | ✓ |          | Service may load BPF programs |
| SystemCallArchitectures= | ✗ |          | Service may execute system calls with all ABIs |
| MemoryDenyWriteExecute= | ✗ |          | Service may create writable executable memory mappings |
| RestrictNamespaces=~user | ✗ |          | Service may create user namespaces |
| RestrictNamespaces=~pid | ✗ |          | Service may create process namespaces |
| RestrictNamespaces=~net | ✗ |          | Service may create network namespaces |
| RestrictNamespaces=~uts | ✗ |          | Service may create hostname namespaces |
| RestrictNamespaces=~mnt | ✗ |          | Service may create file system namespaces |
| RestrictNamespaces=~cgroup | ✗ |          | Service may create cgroup namespaces |
| RestrictSUIDSGID= | ✗ |          | Service may create SUID/SGID files |
| RestrictNamespaces=~ipc | ✗ |          | Service may create IPC namespaces |
| ProtectHostname= | ✗ |          | Service may change system host/domainname |
| LockPersonality= | ✗ |          | Service may change ABI personality |
| ProtectKernelTunables= | ✗ |          | Service may alter kernel tunables |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~… | ✗ |          | Service may allocate exotic sockets |
| RestrictRealtime= | ✗ |          | Service may acquire realtime scheduling |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✓ |          | Service has no raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✓ |          | Service has no ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          |  |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✓ |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✓ |          | Service has no audit subsystem access |
| PrivateTmp= | ✓ |          | Service has no access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✓ |          | Service has no access to kernel logging |
| ProtectHome= | ✓ |          | Service has no access to home directories |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗ |          | Service has network configuration privileges |
| ProtectSystem= | ✗ |          | Service has limited write access to the OS file hierarchy |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| KeyringMode= | ✓ |          | Service doesn't share key material with other services |
| Delegate= | ✓ |          | Service does not maintain its own delegated control group subtree |
| SystemCallFilter=~@clock | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@cpu-emulation | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@debug | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@module | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@mount | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@obsolete | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@privileged | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@raw-io | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@reboot | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@resources | ✗ |          | Service does not filter system calls |
| SystemCallFilter=~@swap | ✗ |          | Service does not filter system calls |
| IPAddressDeny= | ✗ |          | Service does not define an IP address allow list |
| NotifyAccess= | ✓ |          | Service child processes cannot alter service state |
| CapabilityBoundingSet=~CAP_SYS_PACCT | ✓ |          | Service cannot use acct() |
| CapabilityBoundingSet=~CAP_KILL | ✓ |          | Service cannot send UNIX signals to arbitrary processes |
| CapabilityBoundingSet=~CAP_WAKE_ALARM | ✓ |          | Service cannot program timers that wake up the system |
| CapabilityBoundingSet=~CAP_(DAC_* | FOWNER |          | ✓ |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✓ |          | Service cannot mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✓ |          | Service cannot lock memory into RAM |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✓ |          | Service cannot load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✓ |          | Service cannot issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✓ |          | Service cannot issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✓ |          | Service cannot issue chroot() |
| PrivateMounts= | ✓ |          | Service cannot install system mounts |
| CapabilityBoundingSet=~CAP_BLOCK_SUSPEND | ✓ |          | Service cannot establish wake locks |
| CapabilityBoundingSet=~CAP_LEASE | ✓ |          | Service cannot create file leases |
| CapabilityBoundingSet=~CAP_MKNOD | ✓ |          | Service cannot create device nodes |
| CapabilityBoundingSet=~CAP_(CHOWN | FSETID |          | ✓ |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✓ |
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          |  |
| CapabilityBoundingSet=~CAP_MAC_* | ✓ |          | Service cannot adjust SMACK MAC |
| UMask= | ✗ |          | Files created by service are world-readable by default |

---

## Summary of Improvements

- **Baseline Findings:**  
  - `<service_name>.service` was initially configured with an exposure level of **X.X/10**.  
  - Critical security features such as sandboxing, capability restrictions, and filesystem protections were not enabled by default.  

- **Hardened Configuration:**  
  - The hardened configuration applies the following systemd security directives:  
    - `NoNewPrivileges=yes`
    - `ProtectSystem=strict`
    - `PrivateDevices=yes`
    - (add others as applied)  

---

## Remaining Risks / Justifications

- Certain options could not be applied due to service functionality requirements:
  - Example: `ProtectHome=yes` was not enabled as the service needs access to user directories.
  - Example: `CapabilityBoundingSet` was reduced but still includes `CAP_NET_BIND_SERVICE` for network functionality.

- Further hardening could include AppArmor or SELinux profiles.

---

## Raw Reports

- [Baseline Security Report](./systemd_security_report/baseline.txt)
- [Hardened Security Report](./systemd_security_report/hardened.txt)

