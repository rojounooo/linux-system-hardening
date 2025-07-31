# Configuring iptables Firewall

## What is it

`iptables` is a Linux utility that allows you to configure rules for filtering network traffic. It acts as a firewall, controlling incoming and outgoing packets based on defined security policies. Proper configuration helps protect your system from unauthorized access and network attacks.

---

## Steps

1. **Flush existing iptables rules**

    - This clears all current firewall rules, so you start fresh.
    ```bash
    sudo iptables -F
    ```

2. **Set default policies**

    - Drop all incoming and forwarding packets by default, allow all outgoing.
    ```bash
    sudo iptables -P INPUT DROP
    sudo iptables -P FORWARD DROP
    sudo iptables -P OUTPUT ACCEPT
    ```

3. **Allow loopback interface traffic**

    - Allow all traffic on the loopback interface (`localhost`).
    ```bash
    sudo iptables -A INPUT -i lo -j ACCEPT
    ```

4. **Allow established and related connections**

    - Permit incoming packets that are part of existing connections or related to them.
    ```bash
    sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    ```

5. **Allow SSH access**

    - Enable incoming SSH connections on port 2222 (replace with your SSH port).
    ```bash
    sudo iptables -A INPUT -p tcp --dport 2222 -j ACCEPT
    ```

6. **Save your iptables rules**

    ```bash
    sudo apt install iptables-persistent
    sudo netfilter-persistent save
    ```

7. **Verify**
    
    - To check current active rules, run:
    ```bash
    sudo iptables -L -n -v
    ```