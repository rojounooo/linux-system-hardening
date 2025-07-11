# System Services Index

| Service Name               | Description                              | Service Hardening Folder Link                        |
|----------------------------|------------------------------------------|-----------------------------------------------------|
| unattended-upgrades.service | Automatic installation of security upgrades | [unattended_upgrades_hardening](./02_boot_and_services/services/unattended_upgrades_hardening) |
| udisks2.service            | Disk management service                  | [udisks2_service_hardening](./02_boot_and_services/services/udisks2_service_hardening)             |
| ssh.service                | Secure Shell (SSH) server                | [ssh_service_hardening](./02_boot_and_services/services/ssh_service_hardening)                     |
| packagekit.service         | Package management service               | [packagekit_service_hardening](./02_boot_and_services/services/packagekit_service_hardening)       |
| getty@tty1.service         | Terminal login on tty1                   | [getty@tty1_service_hardening](./02_boot_and_services/services/getty@tty1_service_hardening)       |
| cron.service               | Job scheduler service                    | [cron_service_hardening](./02_boot_and_services/services/cron_service_hardening)                   |
| multipathd.service         | Multipath device manager                 | [multipathd_service_hardening](./02_boot_and_services/services/multipathd_service_hardening)       |
| dbus.service               | D-Bus message bus system                 | [dbus_service_hardening](./02_boot_and_services/services/dbus_service_hardening)                   |
| user@1000.service          | User session service (UID 1000)          | [user@1000_service_hardening](./02_boot_and_services/services/user@1000_service_hardening)         |
| systemd-udevd.service      | Device event manager                     | [udevd_service_hardening](./02_boot_and_services/services/udevd_service_hardening)                 |
| rsyslog.service            | System logging service                   | [rsyslog_service_hardening](./02_boot_and_services/services/rsyslog_service_hardening)             |
| ModemManager.service       | Modem management service                 | [ModemManager_service_hardening](./02_boot_and_services/services/ModemManager_service_hardening)   |
| systemd-journald.service   | Journal logging service                  | [journald_service_hardening](./02_boot_and_services/services/journald_service_hardening)           |
| systemd-logind.service     | User login management                    | [logind_service_hardening](./02_boot_and_services/services/logind_service_hardening)               |
| systemd-networkd.service   | Network management                       | [networkd_service_hardening](./02_boot_and_services/services/networkd_service_hardening)           |
| systemd-resolved.service   | DNS resolver service                     | [resolved_service_hardening](./02_boot_and_services/services/resolved_service_hardening)           |
| systemd-timesyncd.service  | Time synchronization service             | [timesyncd_service_hardening](./02_boot_and_services/services/timesyncd_service_hardening)         |
| polkit.service             | PolicyKit authorization manager         | [polkit_service_hardening](./02_boot_and_services/services/polkit_service_hardening)               |
