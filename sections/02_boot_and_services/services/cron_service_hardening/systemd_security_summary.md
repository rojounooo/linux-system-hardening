# Systemd Security Summary – `cron.service`

## Exposure Level

| Stage      | Exposure Score |
|------------|----------------|
| Baseline   |     9.6        |
| Hardened   |                |

---

## Key Security Options

| Setting                                 | Baseline | Hardened | Notes                                               |
|-----------------------------------------|----------|----------|-----------------------------------------------------|
| RootDirectory                           | ✗        |        | Restrict service root directory                      |
| User                                   | ✗        |         | Run service as a non-root user                        |
| CAP_SYS_TIME                           | ✗        |         | Prevent changing system time                          |
| NoNewPrivileges                        | ✗        |         | Prevent privilege escalation                          |
| PrivateDevices                        | ✗        |         | Isolate device files                                  |
| ProtectClock                          | ✗        |         | Protect kernel clock                                  |
| CAP_SYS_PACCT                        | ✗        |         | Disable process accounting                            |
| CAP_KILL                             | ✗        |         | Restrict process kill privileges                      |
| ProtectKernelLogs                     | ✗        |         | Protect kernel logs                                   |
| CAP_WAKE_ALARM                       | ✗        |         | Restrict wake alarm                                   |
| CAP_(DAC_*|FOWNER|IPC_OWNER)          | ✗        |         | Restrict DAC and ownership capabilities               |
| CAP_BPF                              | ✗        |         | Restrict BPF usage                                   |
| CAP_LINUX_IMMUTABLE                  | ✗        |         | Prevent immutable flag changes                        |
| CAP_IPC_LOCK                        | ✗        |        | Prevent locking shared memory                         |
| ProtectKernelModules                  | ✗        |         | Protect kernel modules                                |
| CAP_SYS_MODULE                      | ✗        |         | Prevent module loading/unloading                      |
| CAP_SYS_TTY_CONFIG                  | ✗        |        | Restrict TTY configuration                            |
| CAP_SYS_BOOT                        | ✗        |         | Prevent reboot privileges                             |
| CAP_SYS_CHROOT                      | ✗        |         | Restrict chroot system calls                          |
| PrivateMounts                       | ✗        |         | Use private mount namespace                           |
| SystemCallArchitectures              | ✗        |         | Restrict syscalls by architecture                     |
| CAP_BLOCK_SUSPEND                   | ✗        |         | Restrict blocking suspend                             |
| MemoryDenyWriteExecute              | ✗        |         | Deny writable executable memory                       |
| RestrictNamespaces=~user            | ✗        |         | Restrict user namespaces                              |
| RestrictNamespaces=~pid             | ✗        |         | Restrict PID namespaces                               |
| RestrictNamespaces=~net             | ✗        |         | Restrict network namespaces                           |
| RestrictNamespaces=~uts             | ✗        |         | Restrict UTS namespaces                               |
| RestrictNamespaces=~mnt             | ✗        |        | Restrict mount namespaces                             |
| CAP_LEASE                           | ✗        |         | Restrict file lease capabilities                      |
| CAP_MKNOD                           | ✗        |        | Restrict creating device files                        |
| RestrictNamespaces=~cgroup          | ✗        |        | Restrict cgroup namespaces                            |
| RestrictSUIDSGID                   | ✗        |        | Restrict setuid/setgid                                |
| RestrictNamespaces=~ipc             | ✗        |         | Restrict IPC namespaces                               |
| ProtectHostname                   | ✗        |         | Protect hostname from modification                    |
| CAP_(CHOWN|FSETID|SETFCAP)          | ✗        |        | Restrict ownership and file capability setting        |
| CAP_SET(UID|GID|PCAP)               | ✗        |         | Restrict user/group ID setting                        |
| LockPersonality                    | ✗        |        | Lock personality settings                             |
| ProtectKernelTunables             | ✗        |        | Protect kernel tunables                               |
| RestrictAddressFamilies=~AF_PACKET  | ✗        |         | Restrict AF_PACKET sockets                            |
| RestrictAddressFamilies=~AF_NETLINK | ✗        |         | Restrict AF_NETLINK sockets                           |
| RestrictAddressFamilies=~AF_UNIX    | ✗        |         | Restrict AF_UNIX sockets                              |
| RestrictAddressFamilies=~…          | ✗        |         | Restrict other address families                       |
| RestrictAddressFamilies=~AF_(INET|INET6) | ✗    |         | Restrict internet socket families                     |
| CapabilityBoundingSet=~CAP_MAC_*    | ✗        |         | Service may adjust SMACK MAC                          |
| RestrictRealtime=                  | ✗        |         | Service may not acquire realtime scheduling          |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✗       |         | Service raw I/O access restricted                     |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✗       |         | Ptrace debugging restricted                           |
| CapabilityBoundingSet=~CAP_SYS_(NICE|RESOURCE) | ✗ |        | Resource usage parameter changes restricted          |
| DeviceAllow=                      | ✗        |         | Device ACL applied                                    |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗       |         | Network config privileges restricted                  |
| ProtectSystem=                   | ✗        |         | OS filesystem read-only or masked                      |
| ProtectProc=                     | ✗        |         | /proc tree access restricted                           |
| ProcSubset=                      | ✗        |         | Non-process /proc files restricted                    |
| ProtectHome=                    | ✗        | ✓       | Home directory access restricted                       |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE|BROADCAST|RAW) | ✗ |         | Elevated networking privileges restricted             |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✗       |         | Audit subsystem access restricted                      |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗       |         | Admin privileges restricted                            |
| PrivateNetwork=                 | ✗        |         | Service network isolated from host                     |
| PrivateUsers=                   | ✗        |         | User namespace isolation                               |
| PrivateTmp=                    | ✗        |        | Private /tmp directory                                 |
| CapabilityBoundingSet=~CAP_SYSLOG | ✗        |        | Kernel logging access restricted                        |
| KeyringMode=                   | ✓        |          | Service doesn't share key material                     |
| Delegate=                      | ✓        |          | Service doesn't maintain delegated control group      |
| SystemCallFilter=~@clock         | ✗        |         | Syscalls filtered for clock                             |
| SystemCallFilter=~@cpu-emulation | ✗        |         | Syscalls filtered for CPU emulation                     |
| SystemCallFilter=~@debug         | ✗        |         | Syscalls filtered for debug                             |
| SystemCallFilter=~@module        | ✗        |         | Syscalls filtered for module                            |
| SystemCallFilter=~@mount         | ✗        |         | Syscalls filtered for mount                             |
| SystemCallFilter=~@obsolete      | ✗        |         | Syscalls filtered for obsolete                          |
| SystemCallFilter=~@privileged    | ✗        |         | Syscalls filtered for privileged                        |
| SystemCallFilter=~@raw-io        | ✗        |         | Syscalls filtered for raw I/O                           |
| SystemCallFilter=~@reboot        | ✗        |        | Syscalls filtered for reboot                                                             |
| SystemCallFilter=~@resources     | ✗        |         | Syscalls filtered for resources                         |
| SystemCallFilter=~@swap          | ✗        |         | Syscalls filtered for swap                              |
| IPAddressDeny=                  | ✗        |         | IP address allow list applied                           |
| NotifyAccess=                  | ✓        |          | Service child processes cannot alter service state     |
| UMask=                         | ✗        |         | Restrict file creation mask to avoid world-readable    |

---

## Summary of Improvements

- **Baseline Findings:**  
  - `cron.service` was initially configured with an exposure level of **9.6/10**.  
  - Critical security features such as sandboxing, capability restrictions, and filesystem protections were not enabled by default.  

** Directives Sections:**
  - Privilege & Access Restrictions
  - Filesystem Protections
  - Kernel & Device Isolation
  - Namespace & Syscall Restrictions

---

## Remaining Risks / Justifications

- Certain options could not be applied due to service functionality requirements:
  - RootDirectory=, cannot be changed as cron needs to be run as root 
  - ProtectHome=, this one is optional; if access to user files is required then it has to be set to false

---

## Raw Reports

- [Baseline Security Report](./baseline_config/original.conf)
- [Hardened Security Report](./systemd_security_report/)

