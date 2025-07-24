# Enabling Accounting and Performance Monitoring

## What is `acct`

    -`acct` logs every command executed by users, including when, by whom, and how much system resources it used. This helps with user activity tracking, forensic audits, and detecting misuse or suspicious behavior. E.g. if a script was run then the exact time and command use can be found 

## What is `sysstat`

    - `sysstat` provides real-time and historical data on CPU, memory, disk, and process usage. It helps detect system performance issues and unusual activity patterns that may indicate security threats.

## Steps 

1. Update packages and install `acct` and `sysstat`

    ```bash 
    sudo apt update -y 
    sudo apt install acct sysstat -y
    ```

2. Enable and Start Process Accounting

    ```bash 
    sudo systemctl start acct # Starts the service
    sudo systemctl enable acct # Enables the service at boot
    ```

    - Check status 
    ```bash 
    sudo systemctl status acct
    ```

3. Enable and Start Data Collection 

    ```bash 
    sudo systemctl enable sysstat
    sudo systemctl start sysstat
    ```

    - Check if it's running
    ```bash 
    sudo systemctl status sysstat
    ```

4. Ensure data collection is enabled in config file

    ```bash 
    sudo nano /etc/default/sysstat
    
    # Look for and set 
    ENABLED="true"
    ```

5. Restart service 

    ```bash 
    sudo systemctl restart sysstat
    ```

## Example usage 

### `acct`
| Command             | Description                                   |
| ------------------- | --------------------------------------------- |
| `lastcomm`          | Shows recently executed commands by all users |
| `lastcomm username` | Shows commands executed by a specific user    |
| `sa`                | Summarizes system usage by user and command   |
| `sa -m`             | Reports resource usage by user                |
| `sa -u`             | Lists command usage sorted by CPU time        |

### `sysstat`
| Command        | Description                                       |
| -------------- | ------------------------------------------------- |
| `mpstat`       | Displays CPU usage statistics                     |
| `iostat -xz 1` | Shows extended disk I/O stats updated every 1 sec |
| `pidstat`      | Shows CPU, memory, and I/O usage per process      |
| `sar -u 1 5`   | Displays CPU usage every second for 5 iterations  |
| `sar -d 1 5`   | Displays disk activity over time                  |



