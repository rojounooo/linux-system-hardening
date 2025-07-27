# Hardening User Authentication 

## Steps 

1. Review and Enhance PAM Configuration 

    - Edit PAM password file: 
        ```bash 
        sudo nano /etc/pam.d/common-password
        ```
    
    - Look for a line like the following: 
        ```bash 
        password [success=1 default=ignore] pam_unix.so obscure yescrypt
        ```
    
    - Change to: 
        ```bash 
        password [success=1 default=ignore] pam_unix.so obscure yescrypt rounds=65536
        ```

        - If using `sha512` set rounds to 1000000
    
    - Save and exit 

2. Set Password Expiration Policies:

    - Edit `/etc/login.defs`:
    ```bash 
    sudo nano /etc/login.defs
    ```

    - Adjust or add following settings:
    ```bash 
    PASS_MAX_DAYS   60      # Password expires every 60 days
    PASS_MIN_DAYS   7       # Users must wait 7 days between changes
    PASS_WARN_AGE   14      # Warn users 14 days before password expiry
    ```

    - Save and exit 

    - Enforce for existing users:
    ```bash 
    sudo chage -M 90 -m 7 -W 14 username
    ```

3. Install PAM Password Strength Modules

    - Install pam_pwquality
    ```bash 
    sudo apt update -y
    sudo apt install libpam-pwquality -y
    ```

    - Edit file 
    ```bash 
    sudo nano /etc/pam.d/common-password
    ```
    
    - Add/Modify the following line 
    ```bash 
    password requisite pam_pwquality.so retry=3 minlen=12 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1

    # Min 12 characters
    # At least 1 uppercase (ucredit)
    # 1 lowercase (lcredit)
    # 1 digit (dcredit)
    # 1 special char (ocredit)
    ```

    - Save and Exit

4. Set Stricter umask

    - Modify /etc/login.defs
    ```bash 
    sudo nano /etc/login.defs
    ```

    - Add or change the following line 
    ```bash 
    UMASK 027
    ```

    - Set in /etc/profile for consistency 
    ```bash 
    echo "umask 027" | sudo tee -a /etc/profile.d/umask.sh
    sudo chmod +x /etc/profile.d/umask.sh
    ```
