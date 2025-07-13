# Systemd Security Summary – `systemd-networkd.service`

## Exposure Level

| Stage      | Exposure Score |
|------------|----------------|
| Baseline   |      2.6       |
| Hardened   |                |

---

## Key Security Options

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| SystemCallFilter=~@swap | ✓ |          | System call allow list defined for service, and @swap is not included |
| SystemCallFilter=~@resources | ✗ |          | System call allow list defined for service, and @resources is included (e.g. ioprio_set is allowed) |
| SystemCallFilter=~@reboot | ✓ |          | System call allow list defined for service, and @reboot is not included |
| SystemCallFilter=~@raw-io | ✓ |          | System call allow list defined for service, and @raw-io is not included |
| SystemCallFilter=~@privileged | ✗ |          | System call allow list defined for service, and @privileged is included (e.g. chown is allowed) |
| SystemCallFilter=~@obsolete | ✓ |          | System call allow list defined for service, and @obsolete is not included |
| SystemCallFilter=~@mount | ✓ |          | System call allow list defined for service, and @mount is not included |
| SystemCallFilter=~@module | ✓ |          | System call allow list defined for service, and @module is not included |
| SystemCallFilter=~@debug | ✓ |          | System call allow list defined for service, and @debug is not included |
| SystemCallFilter=~@cpu-emulation | ✓ |          | System call allow list defined for service, and @cpu-emulation is not included |
| SystemCallFilter=~@clock | ✓ |          | System call allow list defined for service, and @clock is not included |
| RemoveIPC= | ✗ |          | Service user may leave SysV IPC objects around |
| User=/DynamicUser= | ✓ |          | Service runs under a static non-root user identity |
| PrivateTmp= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectHome= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectSystem= |  |          | Service runs in special boot phase, option is not appropriate |
| RootDirectory=/RootImage= |  |          | Service runs in special boot phase, option is not appropriate |
| RestrictRealtime= | ✓ |          | Service realtime scheduling access is restricted |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✓ |          | Service processes cannot change the system clock |
| NoNewPrivileges= | ✓ |          | Service processes cannot acquire new privileges |
| AmbientCapabilities= | ✗ |          | Service process receives ambient capabilities |
| PrivateDevices= | ✗ |          | Service potentially has access to hardware devices |
| CapabilityBoundingSet=~CAP_BPF | ✓ |          | Service may load BPF programs |
| SystemCallArchitectures= | ✓ |          | Service may execute system calls only with native ABI |
| ProtectHostname= | ✗ |          | Service may change system host/domainname |
| ProtectKernelTunables= | ✗ |          | Service may alter kernel tunables |
| RestrictAddressFamilies=~AF_PACKET | ✗ |          | Service may allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| ProtectProc= | ✓ |          | Service has restricted access to process tree (/proc hidepid=) |
| SupplementaryGroups= | ✓ |          | Service has no supplementary groups |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✓ |          | Service has no raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✓ |          | Service has no ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          |  |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✓ |          | Service has no audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✓ |          | Service has no administrator privileges |
| CapabilityBoundingSet=~CAP_SYSLOG | ✓ |          | Service has no access to kernel logging |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗ |          | Service has network configuration privileges |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✗ |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| KeyringMode= | ✓ |          | Service doesn't share key material with other services |
| Delegate= | ✓ |          | Service does not maintain its own delegated control group subtree |
| IPAddressDeny= | ✗ |          | Service does not define an IP address allow list |
| NotifyAccess= | ✓ |          | Service child processes cannot alter service state |
| ProtectClock= | ✓ |          | Service cannot write to the hardware clock or system clock |
| CapabilityBoundingSet=~CAP_SYS_PACCT | ✓ |          | Service cannot use acct() |
| CapabilityBoundingSet=~CAP_KILL | ✓ |          | Service cannot send UNIX signals to arbitrary processes |
| ProtectKernelLogs= | ✓ |          | Service cannot read from or write to the kernel log ring buffer |
| CapabilityBoundingSet=~CAP_WAKE_ALARM | ✓ |          | Service cannot program timers that wake up the system |
| CapabilityBoundingSet=~CAP_(DAC_* | FOWNER |          | ✓ |
| ProtectControlGroups= | ✓ |          | Service cannot modify the control group file system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✓ |          | Service cannot mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✓ |          | Service cannot lock memory into RAM |
| ProtectKernelModules= | ✓ |          | Service cannot load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✓ |          | Service cannot load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✓ |          | Service cannot issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✓ |          | Service cannot issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✓ |          | Service cannot issue chroot() |
| PrivateMounts= | ✓ |          | Service cannot install system mounts |
| CapabilityBoundingSet=~CAP_BLOCK_SUSPEND | ✓ |          | Service cannot establish wake locks |
| MemoryDenyWriteExecute= | ✓ |          | Service cannot create writable executable memory mappings |
| RestrictNamespaces=~user | ✓ |          | Service cannot create user namespaces |
| RestrictNamespaces=~pid | ✓ |          | Service cannot create process namespaces |
| RestrictNamespaces=~net | ✓ |          | Service cannot create network namespaces |
| RestrictNamespaces=~uts | ✓ |          | Service cannot create hostname namespaces |
| RestrictNamespaces=~mnt | ✓ |          | Service cannot create file system namespaces |
| CapabilityBoundingSet=~CAP_LEASE | ✓ |          | Service cannot create file leases |
| CapabilityBoundingSet=~CAP_MKNOD | ✓ |          | Service cannot create device nodes |
| RestrictNamespaces=~cgroup | ✓ |          | Service cannot create cgroup namespaces |
| RestrictNamespaces=~ipc | ✓ |          | Service cannot create IPC namespaces |
| CapabilityBoundingSet=~CAP_(CHOWN | FSETID |          | ✓ |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✓ |
| LockPersonality= | ✓ |          | Service cannot change ABI personality |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
| CapabilityBoundingSet=~CAP_MAC_* | ✓ |          | Service cannot adjust SMACK MAC |
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

