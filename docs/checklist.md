# ✅ Manual Linux System Hardening Checklist

This checklist outlines the steps taken to harden a default Linux (e.g., Ubuntu Server) installation.

---

## 🔧 1. Initial Setup and Assessment
- [✅] Fresh minimal Linux installation (Ubuntu/CentOS)
- [✅] Update system packages (`sudo apt update && sudo apt upgrade`)
- [✅] Install assessment tool (e.g., Lynis, OpenSCAP)
- [✅] Run initial baseline scan and save results

---

## 👤 2. User & Access Control
- [✅] Create a new non-root user with `sudo` access
- [✅] Disable root SSH login in `/etc/ssh/sshd_config`
- [ ] Set up SSH key-based authentication
- [ ] Disable password authentication for SSH
- [ ] Limit SSH login attempts and set timeout

---

## 🔐 3. SSH Configuration
- [✅] Change default SSH port (optional)
- [ ] Disable empty passwords
- [ ] Use strong `Ciphers`, `MACs`, and `KexAlgorithms`
- [ ] Restart SSH and test secure login

---

## 🔥 4. Firewall and Network
- [ ] Install and enable UFW (or use iptables/nftables)
- [ ] Allow only necessary ports (e.g., SSH, HTTP/HTTPS)
- [ ] Set default policy to deny incoming traffic
- [ ] Enable firewall and verify rules

---

## 📦 5. Remove Unnecessary Software and Services
- [ ] List running services (`ss -tuln`, `systemctl list-units`)
- [ ] Remove or disable unused services (e.g., `telnet`, `cups`)
- [ ] Disable IPv6 if not needed
- [ ] Disable USB automount (optional)

---

## 📁 6. File System and Permission Hardening
- [ ] Verify and fix permissions on critical files:
  - [ ] `/etc/passwd`
  - [ ] `/etc/shadow`
  - [ ] `/etc/group`
  - [ ] `/var/log/`
- [ ] Enable file integrity monitoring (e.g., AIDE)
- [ ] Set sticky bit on `/tmp`
- [ ] Disable core dumps (`/etc/security/limits.conf`)

---

## 🛡️ 7. Logging and Auditing
- [ ] Install and configure `auditd`
- [ ] Add rules to log:
  - [ ] Login events
  - [ ] Sudo usage
  - [ ] File access/modification
- [ ] Set up log rotation (`logrotate`)
- [ ] Monitor logs for unusual activity

---

## 🔄 8. Patching and Updates
- [ ] Enable unattended security updates
- [ ] Verify and install all available updates
- [ ] Check for vulnerabilities (e.g., `ubuntu-security-status`)
- [ ] Schedule regular patch reviews

---

## 🧪 9. Reassessment and Verification
- [ ] Re-run Lynis/OpenSCAP
- [ ] Compare scores before and after hardening
- [ ] Review logs and service status
- [ ] Document remaining issues or warnings

---

## 🧰 10. Final Script (Bonus)
- [ ] Write a Bash script (`hardening.sh`) to replicate all manual steps
- [ ] Include comments explaining each command
- [ ] Test script on a fresh VM

---

## 📸 11. Documentation and Presentation
- [ ] Take before/after screenshots (Lynis, config files, etc.)
- [ ] Write up each section in a Markdown file or PDF
- [ ] Add explanations and justifications for each change
- [ ] Publish everything to GitHub with a clear README

---

**✅ Goal:** Achieve a hardened, well-documented Linux server configuration that can withstand common attacks and meet basic compliance standards (e.g., CIS Benchmarks).

