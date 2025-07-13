# Systemd Security Summary – `systemd-udevd.service`

## Exposure Level

| Stage      | Exposure Score |
|------------|----------------|
| Baseline   |      7.1       |
| Hardened   |                |

---

## Key Security Options

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| SystemCallFilter=~@swap | ✓ |          | System call allow list defined for service, and @swap is not included |
| SystemCallFilter=~@resources | ✗ |          | System call allow list defined for service, and @resources is included (e.g. ioprio_set is allowed) |
| SystemCallFilter=~@reboot | ✓ |          | System call allow list defined for service, and @reboot is not included |
| SystemCallFilter=~@raw-io | ✗ |          | System call allow list defined for service, and @raw-io is included (e.g. ioperm is allowed) |
| SystemCallFilter=~@privileged | ✗ |          | System call allow list defined for service, and @privileged is included (e.g. chown is allowed) |
| SystemCallFilter=~@obsolete | ✓ |          | System call allow list defined for service, and @obsolete is not included |
| SystemCallFilter=~@mount | ✓ |          | System call allow list defined for service, and @mount is not included |
| SystemCallFilter=~@module | ✗ |          | System call allow list defined for service, and @module is included (e.g. delete_module is allowed) |
| SystemCallFilter=~@debug | ✓ |          | System call allow list defined for service, and @debug is not included |
| SystemCallFilter=~@cpu-emulation | ✓ |          | System call allow list defined for service, and @cpu-emulation is not included |
| SystemCallFilter=~@clock | ✓ |          | System call allow list defined for service, and @clock is not included |
| PrivateTmp= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectHome= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectSystem= |  |          | Service runs in special boot phase, option is not appropriate |
| RootDirectory=/RootImage= |  |          | Service runs in special boot phase, option is not appropriate |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
| RestrictRealtime= | ✓ |          | Service realtime scheduling access is restricted |
| NoNewPrivileges= | ✗ |          | Service processes may acquire new privileges |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✓ |          | Service processes cannot change the system clock |
| AmbientCapabilities= | ✓ |          | Service process does not receive ambient capabilities |
| PrivateDevices= | ✗ |          | Service potentially has access to hardware devices |
| ProtectClock= | ✗ |          | Service may write to the hardware clock or system clock |
| CapabilityBoundingSet=~CAP_SYS_PACCT | ✗ |          | Service may use acct() |
| CapabilityBoundingSet=~CAP_KILL | ✗ |          | Service may send UNIX signals to arbitrary processes |
| ProtectKernelLogs= | ✗ |          | Service may read from or write to the kernel log ring buffer |
| CapabilityBoundingSet=~CAP_(DAC_* | FOWNER |          | ✗ |
| CapabilityBoundingSet=~CAP_BPF | ✗ |          | Service may not load BPF programs |
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✗ |          | Service may lock memory into RAM |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✗ |          | Service may load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✗ |          | Service may issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✗ |          | Service may issue chroot() |
| SystemCallArchitectures= | ✗ |          | Service may execute system calls with all ABIs |
| CapabilityBoundingSet=~CAP_BLOCK_SUSPEND | ✗ |          | Service may establish wake locks |
| RestrictNamespaces=~user | ✗ |          | Service may create user namespaces |
| RestrictNamespaces=~pid | ✗ |          | Service may create process namespaces |
| RestrictNamespaces=~net | ✗ |          | Service may create network namespaces |
| RestrictNamespaces=~uts | ✗ |          | Service may create hostname namespaces |
| RestrictNamespaces=~mnt | ✗ |          | Service may create file system namespaces |
| CapabilityBoundingSet=~CAP_LEASE | ✗ |          | Service may create file leases |
| CapabilityBoundingSet=~CAP_MKNOD | ✗ |          | Service may create device nodes |
| RestrictNamespaces=~cgroup | ✗ |          | Service may create cgroup namespaces |
| RestrictNamespaces=~ipc | ✗ |          | Service may create IPC namespaces |
| CapabilityBoundingSet=~CAP_(CHOWN | FSETID |          | ✗ |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✗ |
| ProtectKernelTunables= | ✗ |          | Service may alter kernel tunables |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| Delegate= | ✗ |          | Service maintains its own delegated control group subtree |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✗ |          | Service has raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✗ |          | Service has ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          | 0.1 |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗ |          | Service has network configuration privileges |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✗ |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✗ |          | Service has audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| CapabilityBoundingSet=~CAP_SYSLOG | ✗ |          | Service has access to kernel logging |
| KeyringMode= | ✓ |          | Service doesn't share key material with other services |
| NotifyAccess= | ✓ |          | Service child processes cannot alter service state |
| CapabilityBoundingSet=~CAP_WAKE_ALARM | ✓ |          | Service cannot program timers that wake up the system |
| PrivateMounts= | ✓ |          | Service cannot install system mounts |
| MemoryDenyWriteExecute= | ✓ |          | Service cannot create writable executable memory mappings |
| ProtectHostname= | ✓ |          | Service cannot change system host/domainname |
| LockPersonality= | ✓ |          | Service cannot change ABI personality |
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
| IPAddressDeny= | ✓ |          | Service blocks all IP address ranges |
| RestrictSUIDSGID= | ✓ |          | SUID/SGID file creation by service is restricted |
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

