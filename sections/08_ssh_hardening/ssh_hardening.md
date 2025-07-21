# Hardening **SSH** Config

# Overview
The `**ssh**` (Open**SSH**) service enables secure remote access to the system over encrypted connections. It is a common target for attackers. Hardening `**SSH**` helps reduce the risk of unauthorized access, brute force attacks, and privilege escalation.

This is different to the earlier hardening using `systemctl edit` as that overrides the configuration at a systemd level. This time the **SSH** config file found in /etc/**SSH**/sshd_config will be edited.

# Steps

1. Change default **SSH** port  

    - By default **SSH** uses port 22. Changing the port provides a small layer of obscurity. **Nmap** only scans the first 1024 ports by default, so using a port higher than 22 (e.g. 2222) means SSH won’t show up in a general scan unless a full port scan is done.  

    - Edit SSH config: 
    ```bash 
    sudo nano /etc/ssh/sshd_config

    # Change port number to chosen port e.g. 2222
    Port 2222
    ```

2. Disable root login over **SSH**  

    - If an unauthorized user gains SSH access, we want them to have minimal privileges. Disabling root login enforces this.
    ```bash 
    PermitRootLogin no
    ```

3. Set up key-based authentication  

    - Passwords are vulnerable to brute force and breaches. SSH key pairs use strong asymmetric cryptography, making them much harder to compromise.  

    - **Generate SSH keys on the local machine (if not already created):**  
    ```bash 
    ssh-keygen -t ed25519 -C "your_email_or_identifier"
    # A passphrase is optional
    ```

    This creates a private key (`id_ed25519`) and a public key (`id_ed25519.pub`) in `~/.ssh`.

    - **Copy the public key to the server:**  

        - If `ssh-copy-id` is installed (Linux only):  
        ```bash
        which ssh-copy-id
        ssh-copy-id -i ~/.ssh/id_ed25519.pub user@remote_host_ip
        ```
        - Or copy manually:  
            1. View the public key:  
            ```bash
            cat ~/.ssh/id_ed25519.pub
            ```
            2. On the server, create `.ssh` and authorized_keys:  
            ```bash
            mkdir -p ~/.ssh
            chmod 700 ~/.ssh
            nano ~/.ssh/authorized_keys
            # Paste the public key and save
            chmod 600 ~/.ssh/authorized_keys
            ```

4. **Test key-based authentication**  

    ✅ **DO NOT disable password authentication yet.**  
    - Open a new terminal session (keep your current one open in case of errors).  
    - Test key-based login:  
    ```bash
    ssh -i ~/.ssh/id_ed25519 user@remote_host_ip
    ```
    - Verify you can log in without entering a password.

5. Disable password authentication  

    - Once key-based authentication works, edit SSH config to disable password login:  
    ```bash
    PasswordAuthentication no
    PubkeyAuthentication yes
    ```


6. Set `AllowTcpForwarding` to `no`  

    - Prevents users from tunneling traffic through the server using SSH.  
    ```bash
    AllowTcpForwarding no
    ```

7. Set `ClientAliveInterval` and `ClientAliveCountMax`  

    - Closes dead or idle connections to free resources and reduce hijacking risks.  
    ```bash
    ClientAliveInterval 30
    ClientAliveCountMax 2
    ```

8. Set `LogLevel` to `VERBOSE`  
    - Enables detailed logs of SSH connections and activities.  
    ```bash
    LogLevel VERBOSE
    ```

9. Set `MaxAuthTries` to 3  
    - Limits the number of failed login attempts before disconnecting.  
    ```bash
    MaxAuthTries 3
    ```

10. Set `MaxSessions` to 2  
    - Restricts the number of open sessions per connection.  
    ```bash
    MaxSessions 2
    ```

11. Disable `TCPKeepAlive`  
    - Stops the server from sending TCP keepalive packets, preventing lingering sessions.  
    ```bash
    TCPKeepAlive no
    ```

12. Disable `X11Forwarding`  
    - Blocks forwarding of GUI applications over SSH.  
    ```bash
    X11Forwarding no
    ```

13. Disable `AllowAgentForwarding`  
    - Prevents abuse of SSH agent forwarding to access client keys.  
    ```bash
    AllowAgentForwarding no
    ```

14. Reload or restart **SSH** service  

    - Apply all configuration changes:  
    ```bash
    sudo systemctl reload sshd
    # or
    sudo systemctl restart sshd
    ```

15. Verify configuration changes  

    - Check active SSH settings:  
    ```bash
    sshd -T | grep -E 'port|permitrootlogin|passwordauthentication|allowtcpforwarding|clientalivecountmax|loglevel|maxauthtries|maxsessions|tcpkeepalive|x11forwarding|allowagentforwarding'
    ```


