# Systemd Security Summary – `unattended_upgrades.service`

## Exposure Level

| Stage      | Exposure Score |
|------------|----------------|
| Baseline   |      9.6       |
| Hardened   |              |

---

## Key Security Options

| Setting                  | Baseline | Hardened | Notes                       |
|--------------------------|----------|----------|-----------------------------|
| NoNewPrivileges          | ✗        |          |                             |
| PrivateDevices           | ✗        |          |                             |
| ProtectSystem            | ✗        |          |                             |
| ProtectHome              | ✗        |          |                             |
| ProtectKernelModules     | ✗        |          |                             |
| ProtectControlGroups     | ✗        |          |                             |
| RestrictAddressFamilies  | ✗        |          |                             |
| CapabilityBoundingSet    | ✗        |          |                             |
| SystemCallFilter         | ✗        |          |                             |
| MemoryDenyWriteExecute   | ✗        |          |                             |
| RestrictRealtime         | ✗        |          |                             |
| PrivateTmp               | ✗        |          |                             |

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

