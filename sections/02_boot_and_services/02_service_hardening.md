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

## Why harden system services 

Unsecured services can be exploited to gain root access to a system. Many services like SSH or Apache listen for connection on network ports, and unless configured properly they can allow unauthorised access or be used in a brute force attack. By securing services or disabling unused ones the potential attack surface is minimised reducing potential entry points for a malicious actor. Software bugs are regularly found and a service that provides root access is especially dangerous. 


## Steps to Harden 

Get a list of all services and output to a file:
```bash 
systemctl list-units --type=service --state=running --no-pager --no-legend | awk '{print $1}' > current_services.txt
``` 

Run systemd-analyze security for each service and output to individual files
```bash 
cat current_services.txt | awk '{print $1}' | xargs -I {} -n 1 -P 4 sh -c 'systemd-analyze security {} > {}_security.txt 2>> errors.log'
``` 

Extract security scores and create a priority hardening list
```bash 
xargs -I {} -P 4 sh -c \ 'score=$(grep "^→ Overall exposure level for {}:" {}_security.txt | cut -d":" -f2 | awk "{print \$1}"); echo "{} $score"' \ < current_services.txt | sort -k2 -n -r > service_priority.txt
``` 

Go through each service file and begin hardening 

## Organizing Service Hardening Documentation

Each service covered in this hardening process will have its own dedicated directory under `/02_boot_and_services/services`. Inside each service directory, you will find detailed hardening steps, configuration examples, and relevant notes specific to that service.

To make navigation easier, an `index.md` file will be maintained in the `/02_boot_and_services` directory. This index will provide links to each individual service's documentation, allowing for quick access and reference as you work through hardening your system services.