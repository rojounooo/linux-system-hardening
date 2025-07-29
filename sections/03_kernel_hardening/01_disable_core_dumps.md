# Disabling core dumps in kernel 

## What is it 
A core dump (or core file) is a snapshot of a program’s memory at the exact moment it crashes. It captures:

    - The state of the memory
    - The CPU registers
    - The call stack
    - Information about threads and variables
They can store details like passwords 

## Steps 

1. Open the limits configuration file:

    ```bash
    sudo nano /etc/security/limits.conf
    ``` 

2. Append following lines
    ```bash 
    * hard core 0
    * soft core 0
    ```

3. Logout and back in (or reboot) 

    ```bash 
    sudo reboot
    ```
