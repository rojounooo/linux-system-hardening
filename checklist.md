# Lynis-Based Linux Hardening Checklist

## Boot and Services
- [✅] Set a password on GRUB boot loader to prevent unauthorized changes or booting in single user mode without a password.  
- [⏳] Harden system services by reviewing their security level:  
      - Run: `systemd-analyze security SERVICE` for each active service  
- [ ] Disable unnecessary protocols like `dccp`, `sctp`, `rds`, and `tipc` if not used.

## Kernel Hardening
- [ ] Disable core dumps explicitly in `/etc/security/limits.conf` if not required, to prevent sensitive data leakage.  
- [ ] Tune sysctl kernel parameters to harden network and system behavior (review sysctl values differing from default profiles).

## User Accounts and Authentication
- [✅] Review and enhance PAM configuration:  
      - Increase password hashing rounds  
      - Set password expiration policies  
      - Configure minimum and maximum password ages in `/etc/login.defs`  
- [✅] Install PAM password strength modules like `pam_cracklib` or `pam_passwdqc`.  
- [✅] Set stricter default umask (e.g., 027) in `/etc/login.defs` to improve file permission defaults.  
- [✅] Set expiration dates on all password-protected accounts when possible.  

## Filesystem and Storage
- [✅] Place `/home`, `/tmp`, and `/var` on separate partitions to limit impact of full disks.  
- [ ] Restrict file permissions appropriately (use `chmod` to fix insecure permissions).  
- [✅] Disable USB storage drivers if not used to prevent unauthorized data transfer.

## Package and Patch Management
- [✅] Keep the system up to date; check Lynis version and update if older than 4 months.  
- [✅] Install `debsums` to verify package integrity regularly.  
- [✅] Install `apt-show-versions` for patch management visibility.  
- [✅] Install `apt-listbugs` and `apt-listchanges` to monitor critical bugs and changes during package upgrades.  
- [✅] Remove unused or unnecessary software packages.

## Logging and Auditing
- [✅] Enable `auditd` to collect audit information and monitor system events.  
- [✅] Enable process accounting (e.g., `acct`) and sysstat for performance and activity monitoring.  
- [ ] Enable logging to an external host for security and archival purposes.  
- [ ] Check and resolve deleted files still in use (to free disk space and improve security).

## SSH Hardening
- [✅] Change the default SSH port from 22 to a non-standard port.
- [✅] Disable root login over SSH.  
- [✅] Disable password authentication; prefer key-based auth.  
- [✅] Disable or restrict SSH features:  
      - `AllowTcpForwarding` set to `no`  
      - `ClientAliveCountMax` reduced (e.g., from 3 to 2)  
      - `LogLevel` set to `VERBOSE`  
      - `MaxAuthTries` reduced (e.g., from 6 to 3)  
      - `MaxSessions` reduced (e.g., from 10 to 2)  
      - Disable `TCPKeepAlive`, `X11Forwarding`, and `AllowAgentForwarding`  


## Network Security
- [✅] Verify firewall is configured and active (e.g., `iptables` rules). Note: iptables modules loaded but no active rules is a warning.  
- [ ] Disable unused network protocols as noted in kernel hardening section.

## Intrusion Prevention and Malware Detection
- [✅] Install and configure Fail2Ban to block repeated authentication failures.  
- [✅] Install a malware scanner (e.g., `rkhunter`, `chkrootkit`, `OSSEC`) for periodic scans.  
- [✅] Install a file integrity monitoring tool to detect changes to critical files.

## Legal and User Awareness
- [ ] Add legal banners to `/etc/issue` and `/etc/issue.net` to warn unauthorized users.

---

