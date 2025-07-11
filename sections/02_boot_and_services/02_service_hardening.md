# Hardening System Services By Reviewing Their Security Levels

## What is a System Service
A **system service** or **daemon** is a background process that is continuously running. It usually starts at system boot and only ends if the system is shutdown or the **daemon** is manually stopped. Each daemon has a particular task such as running a webpage. **`systemd`** is the default system and service manager in modern linux distributions; it can start, stop, enable and disable services. Services often have configurations files found in the /etc directory.

Examples:
- sshd (SSH daemon)
- cron (Task scheduler)
- mysqld (MySQL Database)

## Managing Services: 

**`systemctl`** is the command used to manage services

Common commands:
- start (starts a service)
- stop (stops a service)
- restart (restarts service after editing configuration file)
- enable (enables service to start at boot)
- disable (disables start at boot)
- status (provides information about service, useful for troubleshooting)

Example Syntax: 
```bash 
sudo systemctl restart sshd
```

## Steps to Harden 

Get a list of all services and output to a file:
```bash 
systemctl list-units --type=service --state=running --no-pager --no-legend | awk '{print $1}' > current_services.txt

``` 
Run systemd-analyze security for each service and output to individual files
```bash 
cat current_services.txt | awk '{print $1}' | xargs -I {} -n 1 -P 4 sh -c 'systemd-analyze security {} > {}_security.txt 2>> errors.log'
``` 