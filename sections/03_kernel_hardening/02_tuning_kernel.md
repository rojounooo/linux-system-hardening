# Tuning Kernel 

## Steps

1. Backup config file 

    ```bash 
    sudo cp  /etc/sysctl.d/99-hardening.conf  /etc/sysctl.d/99-hardening.conf.bak
    ```

2. Add the following parameters at the end

    ```bash 
    dev.tty.ldisc_autoload = 0
    fs.protected_fifos = 2
    fs.suid_dumpable = 0
    kernel.core_uses_pid = 1
    kernel.kptr_restrict = 2
    kernel.modules_disabled = 1
    kernel.perf_event_paranoid = 3
    kernel.sysrq = 0
    kernel.unprivileged_bpf_disabled = 1
    net.core.bpf_jit_harden = 2
    net.ipv4.conf.all.accept_redirects = 0
    net.ipv4.conf.all.log_martians = 1
    net.ipv4.conf.all.rp_filter = 1
    net.ipv4.conf.all.send_redirects = 0
    net.ipv4.conf.default.accept_redirects = 0
    net.ipv4.conf.default.accept_source_route = 0
    net.ipv4.conf.default.log_martians = 1
    net.ipv6.conf.all.accept_redirects = 0
    net.ipv6.conf.default.accept_redirects = 0
    ```

3. Save and Exit 

4. Apply changes immediately

    ```bash 
    sudo sysctl --system
    ```

5. Reboot system 
    
    ``bash
    sudo reboot 
    ```
