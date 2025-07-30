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
3. Prevent auto loading of modules 

    ```bash 
    install dccp /bin/true
    install sctp /bin/true
    install rds /bin/true   
    install tipc /bin/true
    ```

4. Update initramfs

    ```bash 
    sudo update-initramfs -u
    ```

5. Reboot system 

    ```bash 
    sudo reboot 
    ```

6. Verify modules are not loaded 

    ```bash 
    lsmod | grep -E 'dccp|sctp|rds|tipc'
    ``` 

