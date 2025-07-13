# Systemd Security Summary – `fwupd.service`

## Exposure Level

| Stage      | Exposure Score |
|------------|----------------|
| Baseline   |      7.7       |
| Hardened   |                |

---

## Key Security Options

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| SystemCallFilter=~@swap | ✗ |          | System call deny list defined for service, and @swap is not included (e.g. swapoff is allowed) |
| SystemCallFilter=~@resources | ✗ |          | System call deny list defined for service, and @resources is not included (e.g. ioprio_set is allowed) |
| SystemCallFilter=~@reboot | ✗ |          | System call deny list defined for service, and @reboot is not included (e.g. kexec_file_load is allowed) |
| SystemCallFilter=~@raw-io | ✗ |          | System call deny list defined for service, and @raw-io is not included (e.g. ioperm is allowed) |
| SystemCallFilter=~@privileged | ✗ |          | System call deny list defined for service, and @privileged is not included (e.g. chown is allowed) |
| SystemCallFilter=~@obsolete | ✗ |          | System call deny list defined for service, and @obsolete is not included (e.g. _sysctl is allowed) |
| SystemCallFilter=~@mount | ✓ |          | System call deny list defined for service, and @mount is included |
| SystemCallFilter=~@module | ✗ |          | System call deny list defined for service, and @module is not included (e.g. delete_module is allowed) |
| SystemCallFilter=~@debug | ✗ |          | System call deny list defined for service, and @debug is not included (e.g. lookup_dcookie is allowed) |
| SystemCallFilter=~@cpu-emulation | ✗ |          | System call deny list defined for service, and @cpu-emulation is not included (e.g. modify_ldt is allowed) |
| SystemCallFilter=~@clock | ✗ |          | System call deny list defined for service, and @clock is not included (e.g. adjtimex is allowed) |
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
| RestrictRealtime= | ✓ |          | Service realtime scheduling access is restricted |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✗ |          | Service processes may change the system clock |
| NoNewPrivileges= | ✗ |          | Service processes may acquire new privileges |
| AmbientCapabilities= | ✓ |          | Service process does not receive ambient capabilities |
| PrivateDevices= | ✗ |          | Service potentially has access to hardware devices |
| ProtectClock= | ✗ |          | Service may write to the hardware clock or system clock |
| CapabilityBoundingSet=~CAP_SYS_PACCT | ✗ |          | Service may use acct() |
| CapabilityBoundingSet=~CAP_KILL | ✗ |          | Service may send UNIX signals to arbitrary processes |
| ProtectKernelLogs= | ✗ |          | Service may read from or write to the kernel log ring buffer |
| CapabilityBoundingSet=~CAP_WAKE_ALARM | ✗ |          | Service may program timers that wake up the system |
| CapabilityBoundingSet=~CAP_(DAC_* | FOWNER |          | ✗ |
| CapabilityBoundingSet=~CAP_BPF | ✗ |          | Service may not load BPF programs |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✗ |          | Service may lock memory into RAM |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✗ |          | Service may issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✗ |          | Service may issue chroot() |
| SystemCallArchitectures= | ✗ |          | Service may execute system calls with all ABIs |
| CapabilityBoundingSet=~CAP_BLOCK_SUSPEND | ✗ |          | Service may establish wake locks |
| MemoryDenyWriteExecute= | ✗ |          | Service may create writable executable memory mappings |
| RestrictNamespaces=~user | ✗ |          | Service may create user namespaces |
| RestrictNamespaces=~pid | ✗ |          | Service may create process namespaces |
| RestrictNamespaces=~net | ✗ |          | Service may create network namespaces |
| RestrictNamespaces=~uts | ✗ |          | Service may create hostname namespaces |
| RestrictNamespaces=~mnt | ✗ |          | Service may create file system namespaces |
| CapabilityBoundingSet=~CAP_LEASE | ✗ |          | Service may create file leases |
| CapabilityBoundingSet=~CAP_MKNOD | ✗ |          | Service may create device nodes |
| RestrictNamespaces=~cgroup | ✗ |          | Service may create cgroup namespaces |
| RestrictSUIDSGID= | ✗ |          | Service may create SUID/SGID files |
| RestrictNamespaces=~ipc | ✗ |          | Service may create IPC namespaces |
| ProtectHostname= | ✗ |          | Service may change system host/domainname |
| CapabilityBoundingSet=~CAP_(CHOWN | FSETID |          | ✗ |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✗ |
| LockPersonality= | ✗ |          | Service may change ABI personality |
| ProtectKernelTunables= | ✗ |          | Service may alter kernel tunables |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| ProtectSystem= | ✗ |          | Service has very limited write access to the OS file hierarchy |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✗ |          | Service has raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✗ |          | Service has ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          | 0.1 |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| PrivateTmp= | ✓ |          | Service has no access to other software's temporary files |
| ProtectHome= | ✓ |          | Service has no access to home directories |
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
| Delegate= | ✓ |          | Service does not maintain its own delegated control group subtree |
| IPAddressDeny= | ✗ |          | Service does not define an IP address allow list |
| NotifyAccess= | ✓ |          | Service child processes cannot alter service state |
| ProtectControlGroups= | ✓ |          | Service cannot modify the control group file system |
| ProtectKernelModules= | ✓ |          | Service cannot load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✓ |          | Service cannot load kernel modules |
| PrivateMounts= | ✓ |          | Service cannot install system mounts |
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
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

