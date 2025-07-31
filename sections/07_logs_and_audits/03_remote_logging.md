# Enable logging to a remote server/system

## What is it
Logging to an external server allows backup of logs, it can be used to preserve forensic data during or after a breach. It can also allow for real-time alerting.

## Steps
1. Install rsyslog 

    ```bash 
    sudo apt update
    sudo apt install rsyslog -y
    ```

2. Backup config file
    
    ```bash 
    sudo cp /etc/rsyslog.conf /etc/rsyslog.conf.bak
    ```

3. Edit configuration file 

    ```
    sudo nano /etc/rsyslog.conf
    ```

4. Add line for TCP (preferred over UDP) in bottom section

    ```bash
    *.*@@REMOTE-HOST-IP:514
    ```

5. Enable TCP Module (if remote host is also ubuntu)

    ```bash 
    module(load="imtcp")
    input(type="imtcp" port="514")
    ```

6. Restart syslog

    ```bash 
    sudo systemctl restart rsyslog
    ```

7. Test 

    ```bash 
    logger "Syslog test from Ubuntu VM
    ```
