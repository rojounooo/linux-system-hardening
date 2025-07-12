# Unattended Upgrades Hardening

## Service Overview
The `unattended-upgrades` service automatically downloads and installs security updates. It operates without user intervention to ensure critical patches are applied promptly, reducing exposure to known vulnerabilities. Hardening ensures it performs updates securely.

## Why Hardening is Needed
- Runs as root:
    - Has full root privileges to install/restart packages, modify system files and restart services 
    - A vulnerability in the service or in a package could be compromised for PrivEsc

- Untrusted inputs:
    - DUring updates, external repos are used. This means that malicious packages or can be inejcted or data can be tampered with via a MitM attack.

## Hardening Goals

