# Disabling USB Storage Drivers

## Why do this 
Disabling USB storage drivers prevents unauthorized access to or exfiltration of data via removable media. If a malicious actor gains physical access to the server, they could:

    - Copy sensitive data to a USB drive for exfiltration.
    - Introduce malware using infected USB devices (e.g., “USB Rubber Ducky” or BadUSB attacks).
    - Bypass network-based security controls by using physical media for data transfer.


## Steps

1. Prevent loading the `usb-storage` module:
    - Blacklist the module in `/etc/modprobe.d`
    ```bash 
    sudo nano /etc/modprobe.d/disable-usb-storage.conf
    ```

    - Add the following lines 
    ```bash 
    # Disable USB storage devices
    blacklist usb-storage # Tells system not to load module automatically
    install usb-storage /bin/true # Prevents manual loading of modprobe usb-storage
    ```

2. Unload module if it's already in memory:
    ```bash 
    sudo modprobe -r usb-storage
    ```

3. Prevent other USB storage drivers: 
    - Create blacklist file

    ```bash 
    sudo nano /etc/modprobe.d/disable-ums.conf
    ```

    - Add the following lines: 
    ```bash 
    blacklist ums-alauda
    blacklist ums-cypress
    blacklist ums-datafab
    blacklist ums-eneub6250
    blacklist ums-freecom
    blacklist ums-isd200
    blacklist ums-jumpshot
    blacklist ums-karma
    blacklist ums-onetouch
    blacklist ums-sddr09
    blacklist ums-sddr55
    blacklist ums-usbat
    ```

4. Update initramfs

    - `usb-storage` is found in initramfs which is loaded before the root filesystem so initramfs needs to be edited.
    ```bash 
    sudo update-initramfs -u
    ```

5. Reboot 
    ```bash 
    sudo reboot
    ```

## Testing 

1. Try to load `usb-storage` manually 
    ```bash 
    sudo modprobe usb-storage 
    ``` 

2. Try plugging in a usb drive and check 
    ```bash 
    lsmod | grep usb_storage
    ```




