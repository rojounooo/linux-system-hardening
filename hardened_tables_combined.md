### cron.service_security.md

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|

---

### dbus.service_security.md

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| PrivateTmp= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectHome= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectSystem= |  |          | Service runs in special boot phase, option is not appropriate |
| RootDirectory=/RootImage= |  |          | Service runs in special boot phase, option is not appropriate |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
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
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✗ |          | Service may lock memory into RAM |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✗ |          | Service may load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✗ |          | Service may issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✗ |          | Service may issue chroot() |
| PrivateMounts= | ✗ |          | Service may install system mounts |
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
| RestrictAddressFamilies=~AF_PACKET | ✗ |          | Service may allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~… | ✗ |          | Service may allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| RestrictRealtime= | ✗ |          | Service may acquire realtime scheduling |
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
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for dbus.service: 9.5 UNSAFE 😨 |

---

### fwupd.service_security.md

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
| Overall | → |          | exposure level for fwupd.service: 7.7 EXPOSED 🙁 |

---

### getty@tty1.service_security.md

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
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
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✗ |          | Service may lock memory into RAM |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✗ |          | Service may load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✗ |          | Service may issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✗ |          | Service may issue chroot() |
| PrivateMounts= | ✗ |          | Service may install system mounts |
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
| RestrictAddressFamilies=~AF_PACKET | ✗ |          | Service may allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~… | ✗ |          | Service may allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| RestrictRealtime= | ✗ |          | Service may acquire realtime scheduling |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✗ |          | Service has raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✗ |          | Service has ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          | 0.1 |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗ |          | Service has network configuration privileges |
| ProtectSystem= | ✗ |          | Service has full access to the OS file hierarchy |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| ProtectHome= | ✗ |          | Service has full access to home directories |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✗ |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✗ |          | Service has audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| PrivateTmp= | ✗ |          | Service has access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✗ |          | Service has access to kernel logging |
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
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for getty@tty1.service: 9.6 UNSAFE 😨 |

---

### ModemManager.service_security.md

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
| Overall | → |          | exposure level for ModemManager.service: 6.3 MEDIUM 😐 |

---

### multipathd.service_security.md

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| PrivateTmp= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectHome= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectSystem= |  |          | Service runs in special boot phase, option is not appropriate |
| RootDirectory=/RootImage= |  |          | Service runs in special boot phase, option is not appropriate |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
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
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✗ |          | Service may lock memory into RAM |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✗ |          | Service may load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✗ |          | Service may issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✗ |          | Service may issue chroot() |
| PrivateMounts= | ✗ |          | Service may install system mounts |
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
| RestrictAddressFamilies=~AF_PACKET | ✗ |          | Service may allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~… | ✗ |          | Service may allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| RestrictRealtime= | ✗ |          | Service may acquire realtime scheduling |
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
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for multipathd.service: 9.5 UNSAFE 😨 |

---

### polkit.service_security.md

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
| RemoveIPC= | ✓ |          | Service user cannot leave SysV IPC objects around |
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| User=/DynamicUser= | ✓ |          | Service runs under a static non-root user identity |
| RestrictRealtime= | ✓ |          | Service realtime scheduling access is restricted |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✓ |          | Service processes cannot change the system clock |
| NoNewPrivileges= | ✓ |          | Service processes cannot acquire new privileges |
| AmbientCapabilities= | ✓ |          | Service process does not receive ambient capabilities |
| CapabilityBoundingSet=~CAP_BPF | ✓ |          | Service may load BPF programs |
| SystemCallArchitectures= | ✓ |          | Service may execute system calls only with native ABI |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✗ |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| ProtectSystem= | ✓ |          | Service has strict read-only access to the OS file hierarchy |
| SupplementaryGroups= | ✓ |          | Service has no supplementary groups |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✓ |          | Service has no raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✓ |          | Service has no ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          |  |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✓ |          | Service has no network configuration privileges |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✓ |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✓ |          | Service has no audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✓ |          | Service has no administrator privileges |
| PrivateTmp= | ✓ |          | Service has no access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✓ |          | Service has no access to kernel logging |
| ProtectHome= | ✓ |          | Service has no access to home directories |
| PrivateDevices= | ✓ |          | Service has no access to hardware devices |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| DeviceAllow= | ✗ |          | Service has a device ACL with some special devices: char-rtc:r /dev/null:rw |
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
| ProtectHostname= | ✓ |          | Service cannot change system host/domainname |
| CapabilityBoundingSet=~CAP_(CHOWN | FSETID |          | ✓ |
| LockPersonality= | ✓ |          | Service cannot change ABI personality |
| ProtectKernelTunables= | ✓ |          | Service cannot alter kernel tunables (/proc/sys, …) |
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✓ |          | Service cannot allocate netlink sockets |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          |  |
| CapabilityBoundingSet=~CAP_MAC_* | ✓ |          | Service cannot adjust SMACK MAC |
| RestrictSUIDSGID= | ✓ |          | SUID/SGID file creation by service is restricted |
| UMask= | ✓ |          | Files created by service are accessible only by service's own user by default |
| Overall | → |          | exposure level for polkit.service: 1.6 OK 🙂 |

---

### rsyslog.service_security.md

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
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✓ |          | Service processes cannot change the system clock |
| NoNewPrivileges= | ✓ |          | Service processes cannot acquire new privileges |
| AmbientCapabilities= | ✓ |          | Service process does not receive ambient capabilities |
| PrivateDevices= | ✗ |          | Service potentially has access to hardware devices |
| ProtectKernelLogs= | ✗ |          | Service may read from or write to the kernel log ring buffer |
| CapabilityBoundingSet=~CAP_(DAC_* | FOWNER |          | ✗ |
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_BPF | ✓ |          | Service may load BPF programs |
| PrivateMounts= | ✗ |          | Service may install system mounts |
| SystemCallArchitectures= | ✗ |          | Service may execute system calls with all ABIs |
| CapabilityBoundingSet=~CAP_BLOCK_SUSPEND | ✗ |          | Service may establish wake locks |
| MemoryDenyWriteExecute= | ✗ |          | Service may create writable executable memory mappings |
| RestrictNamespaces=~user | ✗ |          | Service may create user namespaces |
| RestrictNamespaces=~pid | ✗ |          | Service may create process namespaces |
| RestrictNamespaces=~net | ✗ |          | Service may create network namespaces |
| RestrictNamespaces=~uts | ✗ |          | Service may create hostname namespaces |
| RestrictNamespaces=~mnt | ✗ |          | Service may create file system namespaces |
| CapabilityBoundingSet=~CAP_LEASE | ✗ |          | Service may create file leases |
| RestrictNamespaces=~cgroup | ✗ |          | Service may create cgroup namespaces |
| RestrictSUIDSGID= | ✗ |          | Service may create SUID/SGID files |
| RestrictNamespaces=~ipc | ✗ |          | Service may create IPC namespaces |
| CapabilityBoundingSet=~CAP_(CHOWN | FSETID |          | ✗ |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✗ |
| LockPersonality= | ✗ |          | Service may change ABI personality |
| ProtectKernelTunables= | ✗ |          | Service may alter kernel tunables |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| RestrictRealtime= | ✗ |          | Service may acquire realtime scheduling |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          | 0.1 |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✓ |          | Service has no raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✓ |          | Service has no ptrace() debugging abilities |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✓ |          | Service has no audit subsystem access |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗ |          | Service has network configuration privileges |
| ProtectSystem= | ✗ |          | Service has full access to the OS file hierarchy |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| ProtectHome= | ✗ |          | Service has full access to home directories |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✗ |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| PrivateTmp= | ✗ |          | Service has access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✗ |          | Service has access to kernel logging |
| KeyringMode= | ✓ |          | Service doesn't share key material with other services |
| Delegate= | ✓ |          | Service does not maintain its own delegated control group subtree |
| IPAddressDeny= | ✗ |          | Service does not define an IP address allow list |
| NotifyAccess= | ✓ |          | Service child processes cannot alter service state |
| ProtectClock= | ✓ |          | Service cannot write to the hardware clock or system clock |
| CapabilityBoundingSet=~CAP_SYS_PACCT | ✓ |          | Service cannot use acct() |
| CapabilityBoundingSet=~CAP_KILL | ✓ |          | Service cannot send UNIX signals to arbitrary processes |
| CapabilityBoundingSet=~CAP_WAKE_ALARM | ✓ |          | Service cannot program timers that wake up the system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✓ |          | Service cannot mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✓ |          | Service cannot lock memory into RAM |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✓ |          | Service cannot load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✓ |          | Service cannot issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✓ |          | Service cannot issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✓ |          | Service cannot issue chroot() |
| CapabilityBoundingSet=~CAP_MKNOD | ✓ |          | Service cannot create device nodes |
| ProtectHostname= | ✓ |          | Service cannot change system host/domainname |
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✓ |          | Service cannot allocate netlink sockets |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for rsyslog.service: 6.3 MEDIUM 😐 |

---

### ssh.service_security.md

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
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
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✗ |          | Service may lock memory into RAM |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✗ |          | Service may load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✗ |          | Service may issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✗ |          | Service may issue chroot() |
| PrivateMounts= | ✗ |          | Service may install system mounts |
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
| RestrictAddressFamilies=~AF_PACKET | ✗ |          | Service may allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~… | ✗ |          | Service may allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| RestrictRealtime= | ✗ |          | Service may acquire realtime scheduling |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✗ |          | Service has raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✗ |          | Service has ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          | 0.1 |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗ |          | Service has network configuration privileges |
| ProtectSystem= | ✗ |          | Service has full access to the OS file hierarchy |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| ProtectHome= | ✗ |          | Service has full access to home directories |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✗ |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✗ |          | Service has audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| PrivateTmp= | ✗ |          | Service has access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✗ |          | Service has access to kernel logging |
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
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for ssh.service: 9.6 UNSAFE 😨 |

---

### systemd-journald.service_security.md

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
| PrivateTmp= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectHome= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectSystem= |  |          | Service runs in special boot phase, option is not appropriate |
| RootDirectory=/RootImage= |  |          | Service runs in special boot phase, option is not appropriate |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
| RestrictRealtime= | ✓ |          | Service realtime scheduling access is restricted |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✓ |          | Service processes cannot change the system clock |
| NoNewPrivileges= | ✓ |          | Service processes cannot acquire new privileges |
| AmbientCapabilities= | ✓ |          | Service process does not receive ambient capabilities |
| PrivateDevices= | ✗ |          | Service potentially has access to hardware devices |
| ProtectKernelLogs= | ✗ |          | Service may read from or write to the kernel log ring buffer |
| CapabilityBoundingSet=~CAP_(DAC_* | FOWNER |          | ✗ |
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_BPF | ✓ |          | Service may load BPF programs |
| PrivateMounts= | ✗ |          | Service may install system mounts |
| SystemCallArchitectures= | ✓ |          | Service may execute system calls only with native ABI |
| ProtectHostname= | ✗ |          | Service may change system host/domainname |
| CapabilityBoundingSet=~CAP_(CHOWN | FSETID |          | ✗ |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✗ |
| ProtectKernelTunables= | ✗ |          | Service may alter kernel tunables |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✗ |          | Service has ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✓ |          | Service has no raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          |  |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✓ |          | Service has no network configuration privileges |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✓ |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✗ |          | Service has audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| CapabilityBoundingSet=~CAP_SYSLOG | ✗ |          | Service has access to kernel logging |
| KeyringMode= | ✓ |          | Service doesn't share key material with other services |
| Delegate= | ✓ |          | Service does not maintain its own delegated control group subtree |
| NotifyAccess= | ✓ |          | Service child processes cannot alter service state |
| ProtectClock= | ✓ |          | Service cannot write to the hardware clock or system clock |
| CapabilityBoundingSet=~CAP_SYS_PACCT | ✓ |          | Service cannot use acct() |
| CapabilityBoundingSet=~CAP_KILL | ✓ |          | Service cannot send UNIX signals to arbitrary processes |
| CapabilityBoundingSet=~CAP_WAKE_ALARM | ✓ |          | Service cannot program timers that wake up the system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✓ |          | Service cannot mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✓ |          | Service cannot lock memory into RAM |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✓ |          | Service cannot load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✓ |          | Service cannot issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✓ |          | Service cannot issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✓ |          | Service cannot issue chroot() |
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
| LockPersonality= | ✓ |          | Service cannot change ABI personality |
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          |  |
| IPAddressDeny= | ✓ |          | Service blocks all IP address ranges |
| RestrictSUIDSGID= | ✓ |          | SUID/SGID file creation by service is restricted |
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for systemd-journald.service: 4.3 OK 🙂 |

---

### systemd-logind.service_security.md

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
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
| RestrictRealtime= | ✓ |          | Service realtime scheduling access is restricted |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✓ |          | Service processes cannot change the system clock |
| NoNewPrivileges= | ✓ |          | Service processes cannot acquire new privileges |
| AmbientCapabilities= | ✓ |          | Service process does not receive ambient capabilities |
| PrivateDevices= | ✗ |          | Service potentially has access to hardware devices |
| CapabilityBoundingSet=~CAP_(DAC_* | FOWNER |          | ✗ |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_BPF | ✓ |          | Service may load BPF programs |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| SystemCallArchitectures= | ✓ |          | Service may execute system calls only with native ABI |
| CapabilityBoundingSet=~CAP_(CHOWN | FSETID |          | ✗ |
| ProtectKernelTunables= | ✗ |          | Service may alter kernel tunables |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| ProtectSystem= | ✓ |          | Service has strict read-only access to the OS file hierarchy |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✓ |          | Service has no raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✓ |          | Service has no ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          |  |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✓ |          | Service has no network configuration privileges |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✓ |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| PrivateTmp= | ✓ |          | Service has no access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✓ |          | Service has no access to kernel logging |
| ProtectHome= | ✓ |          | Service has no access to home directories |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✗ |          | Service has audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| KeyringMode= | ✓ |          | Service doesn't share key material with other services |
| Delegate= | ✓ |          | Service does not maintain its own delegated control group subtree |
| NotifyAccess= | ✓ |          | Service child processes cannot alter service state |
| ProtectClock= | ✓ |          | Service cannot write to the hardware clock or system clock |
| CapabilityBoundingSet=~CAP_SYS_PACCT | ✓ |          | Service cannot use acct() |
| CapabilityBoundingSet=~CAP_KILL | ✓ |          | Service cannot send UNIX signals to arbitrary processes |
| ProtectKernelLogs= | ✓ |          | Service cannot read from or write to the kernel log ring buffer |
| CapabilityBoundingSet=~CAP_WAKE_ALARM | ✓ |          | Service cannot program timers that wake up the system |
| ProtectControlGroups= | ✓ |          | Service cannot modify the control group file system |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✓ |          | Service cannot lock memory into RAM |
| ProtectKernelModules= | ✓ |          | Service cannot load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✓ |          | Service cannot load kernel modules |
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
| ProtectHostname= | ✓ |          | Service cannot change system host/domainname |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✓ |
| LockPersonality= | ✓ |          | Service cannot change ABI personality |
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          |  |
| IPAddressDeny= | ✓ |          | Service blocks all IP address ranges |
| RestrictSUIDSGID= | ✓ |          | SUID/SGID file creation by service is restricted |
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for systemd-logind.service: 2.8 OK 🙂 |

---

### systemd-networkd.service_security.md

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
| Overall | → |          | exposure level for systemd-networkd.service: 2.6 OK 🙂 |

---

### systemd-resolved.service_security.md

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
| CapabilityBoundingSet=~CAP_BPF | ✓ |          | Service may load BPF programs |
| SystemCallArchitectures= | ✓ |          | Service may execute system calls only with native ABI |
| ProtectHostname= | ✗ |          | Service may change system host/domainname |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✗ |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| SupplementaryGroups= | ✓ |          | Service has no supplementary groups |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✓ |          | Service has no raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✓ |          | Service has no ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          |  |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✓ |          | Service has no network configuration privileges |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✓ |          | Service has no audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✓ |          | Service has no administrator privileges |
| CapabilityBoundingSet=~CAP_SYSLOG | ✓ |          | Service has no access to kernel logging |
| PrivateDevices= | ✓ |          | Service has no access to hardware devices |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✗ |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| DeviceAllow= | ✗ |          | Service has a device ACL with some special devices: char-rtc:r |
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
| LockPersonality= | ✓ |          | Service cannot change ABI personality |
| ProtectKernelTunables= | ✓ |          | Service cannot alter kernel tunables (/proc/sys, …) |
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
| CapabilityBoundingSet=~CAP_MAC_* | ✓ |          | Service cannot adjust SMACK MAC |
| RestrictSUIDSGID= | ✓ |          | SUID/SGID file creation by service is restricted |
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for systemd-resolved.service: 2.2 OK 🙂 |

---

### systemd-timesyncd.service_security.md

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
| SystemCallFilter=~@clock | ✗ |          | System call allow list defined for service, and @clock is included (e.g. adjtimex is allowed) |
| RemoveIPC= | ✗ |          | Service user may leave SysV IPC objects around |
| User=/DynamicUser= | ✓ |          | Service runs under a static non-root user identity |
| PrivateTmp= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectHome= |  |          | Service runs in special boot phase, option is not appropriate |
| ProtectSystem= |  |          | Service runs in special boot phase, option is not appropriate |
| RootDirectory=/RootImage= |  |          | Service runs in special boot phase, option is not appropriate |
| RestrictRealtime= | ✓ |          | Service realtime scheduling access is restricted |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✗ |          | Service processes may change the system clock |
| NoNewPrivileges= | ✓ |          | Service processes cannot acquire new privileges |
| AmbientCapabilities= | ✗ |          | Service process receives ambient capabilities |
| ProtectClock= | ✗ |          | Service may write to the hardware clock or system clock |
| CapabilityBoundingSet=~CAP_BPF | ✓ |          | Service may load BPF programs |
| SystemCallArchitectures= | ✓ |          | Service may execute system calls only with native ABI |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| ProtectProc= | ✓ |          | Service has restricted access to process tree (/proc hidepid=) |
| SupplementaryGroups= | ✓ |          | Service has no supplementary groups |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✓ |          | Service has no raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✓ |          | Service has no ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          |  |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✓ |          | Service has no network configuration privileges |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✓ |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✓ |          | Service has no audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✓ |          | Service has no administrator privileges |
| CapabilityBoundingSet=~CAP_SYSLOG | ✓ |          | Service has no access to kernel logging |
| PrivateDevices= | ✓ |          | Service has no access to hardware devices |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| DeviceAllow= | ✓ |          | Service has a minimal device ACL |
| KeyringMode= | ✓ |          | Service doesn't share key material with other services |
| Delegate= | ✓ |          | Service does not maintain its own delegated control group subtree |
| IPAddressDeny= | ✗ |          | Service does not define an IP address allow list |
| NotifyAccess= | ✓ |          | Service child processes cannot alter service state |
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
| ProtectHostname= | ✓ |          | Service cannot change system host/domainname |
| CapabilityBoundingSet=~CAP_(CHOWN | FSETID |          | ✓ |
| CapabilityBoundingSet=~CAP_SET(UID | GID |          | ✓ |
| LockPersonality= | ✓ |          | Service cannot change ABI personality |
| ProtectKernelTunables= | ✓ |          | Service cannot alter kernel tunables (/proc/sys, …) |
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✓ |          | Service cannot allocate netlink sockets |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
| CapabilityBoundingSet=~CAP_MAC_* | ✓ |          | Service cannot adjust SMACK MAC |
| RestrictSUIDSGID= | ✓ |          | SUID/SGID file creation by service is restricted |
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for systemd-timesyncd.service: 2.1 OK 🙂 |

---

### systemd-udevd.service_security.md

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
| Overall | → |          | exposure level for systemd-udevd.service: 7.1 MEDIUM 😐 |

---

### udisks2.service_security.md

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
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
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✗ |          | Service may lock memory into RAM |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✗ |          | Service may load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✗ |          | Service may issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✗ |          | Service may issue chroot() |
| PrivateMounts= | ✗ |          | Service may install system mounts |
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
| RestrictAddressFamilies=~AF_PACKET | ✗ |          | Service may allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~… | ✗ |          | Service may allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| RestrictRealtime= | ✗ |          | Service may acquire realtime scheduling |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✗ |          | Service has raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✗ |          | Service has ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          | 0.1 |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗ |          | Service has network configuration privileges |
| ProtectSystem= | ✗ |          | Service has full access to the OS file hierarchy |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| ProtectHome= | ✗ |          | Service has full access to home directories |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✗ |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✗ |          | Service has audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| PrivateTmp= | ✗ |          | Service has access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✗ |          | Service has access to kernel logging |
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
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for udisks2.service: 9.6 UNSAFE 😨 |

---

### unattended-upgrades.service_security.md

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
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
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✗ |          | Service may lock memory into RAM |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✗ |          | Service may load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✗ |          | Service may issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✗ |          | Service may issue chroot() |
| PrivateMounts= | ✗ |          | Service may install system mounts |
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
| RestrictAddressFamilies=~AF_PACKET | ✗ |          | Service may allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~… | ✗ |          | Service may allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| RestrictRealtime= | ✗ |          | Service may acquire realtime scheduling |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✗ |          | Service has raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✗ |          | Service has ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          | 0.1 |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗ |          | Service has network configuration privileges |
| ProtectSystem= | ✗ |          | Service has full access to the OS file hierarchy |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| ProtectHome= | ✗ |          | Service has full access to home directories |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✗ |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✗ |          | Service has audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| PrivateTmp= | ✗ |          | Service has access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✗ |          | Service has access to kernel logging |
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
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for unattended-upgrades.service: 9.6 UNSAFE 😨 |

---

### upower.service_security.md

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
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| SupplementaryGroups= |  |          | Service runs as root, option does not matter |
| RemoveIPC= |  |          | Service runs as root, option does not apply |
| User=/DynamicUser= | ✗ |          | Service runs as root user |
| RestrictRealtime= | ✓ |          | Service realtime scheduling access is restricted |
| CapabilityBoundingSet=~CAP_SYS_TIME | ✓ |          | Service processes cannot change the system clock |
| NoNewPrivileges= | ✓ |          | Service processes cannot acquire new privileges |
| AmbientCapabilities= | ✓ |          | Service process does not receive ambient capabilities |
| PrivateDevices= | ✗ |          | Service potentially has access to hardware devices |
| ProtectClock= | ✗ |          | Service may write to the hardware clock or system clock |
| ProtectKernelLogs= | ✗ |          | Service may read from or write to the kernel log ring buffer |
| CapabilityBoundingSet=~CAP_BPF | ✓ |          | Service may load BPF programs |
| SystemCallArchitectures= | ✓ |          | Service may execute system calls only with native ABI |
| RestrictSUIDSGID= | ✗ |          | Service may create SUID/SGID files |
| ProtectHostname= | ✗ |          | Service may change system host/domainname |
| ProtectKernelTunables= | ✗ |          | Service may alter kernel tunables |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| ProtectSystem= | ✓ |          | Service has strict read-only access to the OS file hierarchy |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✓ |          | Service has no raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✓ |          | Service has no ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          |  |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✓ |          | Service has no network configuration privileges |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✓ |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✓ |          | Service has no audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✓ |          | Service has no administrator privileges |
| PrivateTmp= | ✓ |          | Service has no access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✓ |          | Service has no access to kernel logging |
| ProtectHome= | ✓ |          | Service has no access to home directories |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| KeyringMode= | ✓ |          | Service doesn't share key material with other services |
| Delegate= | ✓ |          | Service does not maintain its own delegated control group subtree |
| PrivateUsers= | ✓ |          | Service does not have access to other users |
| NotifyAccess= | ✓ |          | Service child processes cannot alter service state |
| CapabilityBoundingSet=~CAP_SYS_PACCT | ✓ |          | Service cannot use acct() |
| CapabilityBoundingSet=~CAP_KILL | ✓ |          | Service cannot send UNIX signals to arbitrary processes |
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
| RestrictAddressFamilies=~AF_PACKET | ✓ |          | Service cannot allocate packet sockets |
| RestrictAddressFamilies=~… | ✓ |          | Service cannot allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          |  |
| CapabilityBoundingSet=~CAP_MAC_* | ✓ |          | Service cannot adjust SMACK MAC |
| IPAddressDeny= | ✓ |          | Service blocks all IP address ranges |
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for upower.service: 2.4 OK 🙂 |

---

### user@1000.service_security.md

| Setting | Baseline | Hardened | Notes |
|---------|----------|----------|-------|
| --------- | -------- |          | ------------- |
| RemoveIPC= | ✗ |          | Service user may leave SysV IPC objects around |
| KeyringMode= | ✗ |          | Service shares key material with other service |
| RootDirectory=/RootImage= | ✗ |          | Service runs within the host's root directory |
| User=/DynamicUser= | ✓ |          | Service runs under a static non-root user identity |
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
| ProtectControlGroups= | ✗ |          | Service may modify the control group file system |
| CapabilityBoundingSet=~CAP_LINUX_IMMUTABLE | ✗ |          | Service may mark files immutable |
| CapabilityBoundingSet=~CAP_IPC_LOCK | ✗ |          | Service may lock memory into RAM |
| ProtectKernelModules= | ✗ |          | Service may load or read kernel modules |
| CapabilityBoundingSet=~CAP_SYS_MODULE | ✗ |          | Service may load kernel modules |
| CapabilityBoundingSet=~CAP_SYS_TTY_CONFIG | ✗ |          | Service may issue vhangup() |
| CapabilityBoundingSet=~CAP_SYS_BOOT | ✗ |          | Service may issue reboot() |
| CapabilityBoundingSet=~CAP_SYS_CHROOT | ✗ |          | Service may issue chroot() |
| PrivateMounts= | ✗ |          | Service may install system mounts |
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
| RestrictAddressFamilies=~AF_PACKET | ✗ |          | Service may allocate packet sockets |
| RestrictAddressFamilies=~AF_NETLINK | ✗ |          | Service may allocate netlink sockets |
| RestrictAddressFamilies=~AF_UNIX | ✗ |          | Service may allocate local sockets |
| RestrictAddressFamilies=~… | ✗ |          | Service may allocate exotic sockets |
| RestrictAddressFamilies=~AF_(INET | INET6) |          | 0.3 |
| CapabilityBoundingSet=~CAP_MAC_* | ✗ |          | Service may adjust SMACK MAC |
| RestrictRealtime= | ✗ |          | Service may acquire realtime scheduling |
| Delegate= | ✗ |          | Service maintains its own delegated control group subtree |
| CapabilityBoundingSet=~CAP_SYS_RAWIO | ✗ |          | Service has raw I/O access |
| CapabilityBoundingSet=~CAP_SYS_PTRACE | ✗ |          | Service has ptrace() debugging abilities |
| CapabilityBoundingSet=~CAP_SYS_(NICE | RESOURCE) |          | 0.1 |
| SupplementaryGroups= | ✓ |          | Service has no supplementary groups |
| DeviceAllow= | ✗ |          | Service has no device ACL |
| CapabilityBoundingSet=~CAP_NET_ADMIN | ✗ |          | Service has network configuration privileges |
| ProtectSystem= | ✗ |          | Service has full access to the OS file hierarchy |
| ProtectProc= | ✗ |          | Service has full access to process tree (/proc hidepid=) |
| ProcSubset= | ✗ |          | Service has full access to non-process /proc files (/proc subset=) |
| ProtectHome= | ✗ |          | Service has full access to home directories |
| CapabilityBoundingSet=~CAP_NET_(BIND_SERVICE | BROADCAST |          | ✗ |
| CapabilityBoundingSet=~CAP_AUDIT_* | ✗ |          | Service has audit subsystem access |
| CapabilityBoundingSet=~CAP_SYS_ADMIN | ✗ |          | Service has administrator privileges |
| PrivateNetwork= | ✗ |          | Service has access to the host's network |
| PrivateUsers= | ✗ |          | Service has access to other users |
| PrivateTmp= | ✗ |          | Service has access to other software's temporary files |
| CapabilityBoundingSet=~CAP_SYSLOG | ✗ |          | Service has access to kernel logging |
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
| UMask= | ✗ |          | Files created by service are world-readable by default |
| Overall | → |          | exposure level for user@1000.service: 9.4 UNSAFE 😨 |

---