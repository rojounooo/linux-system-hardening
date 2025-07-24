# auditd Implementation and Configuration

## What is auditd 
- `auditd` is a daemon (background process) that records security-relevant events such as modifications to system config files like `/etc/ssh/sshd_config`. The records are logged in `/var/log/audit/audit.log`. Custom rules can be defined in `/etc/audit/audit.rules` or by using `auditctl`

## Steps 

1. Update packages and install auditd
    ```bash 
    sudo apt update -y 
    sudo apt install auditd audispd-plugins -y
    ```

2. Enable and start the service 
    ```bash 
    sudo systemctl enable auditd # Start service on boot 
    sudo systemctl start auditd # Starts the service 
    ```

    - Check status 
    ```bash 
    sudo systemctl status auditd
    ```

3. Verify Logging 
    ```bash 
    sudo tail -f /var/log/audit/audit.log
    ```

4. Add audit rules 

    - Rule to monitor changes to /etc/passwd 
    ```bash
    sudo auditctl -w /etc/passwd -p wa -k passwd_changes

    # -w: watch file 
    # -p: watch permissions (w= write, a= attribute change)
    # -k: key name to identify in logs
     ```

5. Test 
    
    - Append a character to /etc/passwd 
    ```bash 
    sudo echo "#" >> /etc/passwd
    ```

    - Check log for key 

    ```bash 
    sudo ausearch -k passwd_changes
    ```