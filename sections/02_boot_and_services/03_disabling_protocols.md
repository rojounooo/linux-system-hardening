# Disabling unnecessary protocols 

## What are they
`dccp`, `sctp`, `rds`, and `tipc` are rarely used protocols not needed for typical server tasks like SSH, web, or file services. Disabling them reduces the system’s attack surface and prevents potential exploitation of unused kernel modules.

## Steps 

1. Create blacklist config file: 

    ```bash 
    sudo nano /etc/modprobe.d/disable_protocols.conf
    ```

2. Add blacklist lines 

    ```bash 
    blacklist dccp
    blacklist sctp
    blacklist rds
    blacklist tipc
    ```

3. Update initramfs

    ```bash 
    sudo update-initramfs -u
    ```

4. Reboot system 

    ```bash 
    sudo reboot 
    ```

5. Verify modules are not loaded 

    ```bash 
    lsmod | grep -E 'dccp|sctp|rds|tipc'
    ``` 

