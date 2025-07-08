# Setting a Password on GRUB Bootloader:

- **GRUB** (GRand Unified Bootloader) is a program that copies your **OS** into memory. GRUB is installed on the boot sector of your drive (/boot/grub)
- Setting a GRUB password is critical if someone can gain physical or console access to the server. An unauthorised user can easily compromise your system as they can eit boot options. These include:
    - Booting into recovery mode (provides root shell access)
    - Editing boot parameters (kernel arguments)
    - Boot into single-user mode (superuser mode)
    - Bypass security mechanisms (e.g. change root passwords)
    - Boot into another OS

## Steps

1. **Update the system**
    ```bash
    sudo apt update -y
    sudo apt install grub-efi-amd64-bin grub-common
    ```

2. **Check if `grub-mkpasswd-pbkdf2` exists**
    ```bash
    which grub-mkpasswd-pbkdf2
    ```
    - ✅ If the command returns a path (e.g., `/usr/bin/grub-mkpasswd-pbkdf2`), skip to step 4.  
    - ❌ If not found, install `grub2-common`:
    ```bash
    sudo apt install grub2-common
    ```

3. **Generate GRUB password hash**
    ```bash
    grub-mkpasswd-pbkdf2
    ```
    - Enter your desired password twice when prompted.
    - You’ll get output like:
      ```
      PBKDF2 hash of your password is grub.pbkdf2.sha512.10000.<hash_value>
      ```
    - 📋 Copy the entire hash starting from `grub.pbkdf2.sha512...`.

4. **Edit GRUB configuration**
    ```bash
    sudo nano /etc/grub.d/40_custom
    ```
    - Add the following lines (replace `admin` and `<hash_value>` as needed):
      ```bash
      set superusers="admin" # Change to your desired username
      password_pbkdf2 admin grub.pbkdf2.sha512.<hash_value>
      ```

5. **Update GRUB**
    ```bash
    sudo update-grub
    ```

6. **Make GRUB config file read-only**
    ```bash
    sudo chmod 400 /boot/grub/grub.cfg
    ```

---

✅ **Tip:** You can later test GRUB protection by rebooting and pressing `e` on a boot entry. It should now prompt for your password.
