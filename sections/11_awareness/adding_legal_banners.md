# Adding Legal Banners To Warn Unauthorised Users

## What are they 
Banners are pre-login messages that warn users about unauthorized access and provide legal notice before system login. They are set using the `/etc/issue` and `/etc/issue.net` files for local and SSH logins respectively. 

## Steps 

1. Back up `/etc/issue`

    ```bash 
    sudo cp /etc/issue /etc/issue.bak 
    ```

2. Edit /etc/issue 
    ```bash 
    sudo nano /etc/issue
    ```

3. Add your banner message 

    ```bash 
    ********************************************************************
    * WARNING: Unauthorized access to this system is prohibited.       *
    * This system is for the use of authorized users only.             *
    * Individuals using this system without authority, or in excess    *
    * of their authority, are subject to having all their activities   *
    * on this system monitored and recorded by system personnel.       *
    * Anyone using this system expressly consents to such monitoring.  *
    * If such monitoring reveals evidence of criminal activity, such   *
    * evidence may be provided to law enforcement officials.           *
    ********************************************************************
    ```

4. Save and exit

5. Repeat for /etc/issue.net 

6. Edit SSH config

    ```bash 
    sudo nano /etc/ssh/sshd_config
    ```

7. Add/modify the following line

    ```bash 
    Banner /etc/issue.net
    ```

8. Restart SSH service 
    
    ```bash 
    sudo systemctl restart sshd
    ```

