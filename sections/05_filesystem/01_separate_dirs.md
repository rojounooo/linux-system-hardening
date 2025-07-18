# Mounting /home, /tmp and /var on separate partitions 

## Why do this 
Separating `/home`, `/var`, and `/tmp` into their own partitions is a recommended hardening practice. It provides:

- ✅ **Protection from disk exhaustion**  
  Prevents user data, logs, or temporary files from filling up `/` and crashing the system.

- ✅ **Mount option security**  
  Restrict potentially dangerous operations in these directories

- ✅ **Containment of compromises**  
  Malware dropped in `/tmp` or user home dirs can’t execute or escalate privileges.

- ✅ **Improved system recovery**  
  Filesystem corruption in one partition won’t affect others.

## Steps 

Before You Start:
    - Make a snapshot of your VM or backup important data (in case something goes wrong).
    - Create 3 virtual disks 
        - Settings -> Storage 
        - Controller: SATA or Controller: SCSI
        - Add Hard Disk -> Create New Disk:
            - VDI
            - Size: 5GB
        - Repeat for 3 disks (one for each directory)
        - Boot VM
    - You’ll need sudo/root access.

1. Create partitions:

    - Find your disk
    ```bash
    lsblk
    ```
    - You should see 
    ```bash 
    sdb 5G
    sdc 5G
    sdd 5G 
    ```

2. Partition and format each disk 

    - For each disk 
        - Partition 
            ```bash 
            sudo fdisk /dev/<disk name>

            # For the prompts 
            n
            p
            Enter 
            Enter 
            Enter 
            w
    
        - Format as ext4
            ```bash 
            sudo mkfs.ext4 /dev/sdb
            sudo mkfs.ext4 /dev/sdc
            sudo mkfs.ext4 /dev/sdd
            ``` 

3. Mount and migrate data

    - Temp mount
        ```bash 
        sudo mount /dev/<sdb> /mnt
        sudo rsync -av /home/ /mnt/
        sudo umount /mnt
        ```
        - Repeat for /var (/dev/sdc) and /tmp (/dev/sdd)

    - Permanent Mount 

        - Find UUIDs:
            ```bash 
            sudo blkid

            # Example Output 
            /dev/sda1: UUID="c8b5f3d2-4a1e-4f77-b3da-84a6fa2f5be6" TYPE="ext4" PARTUUID="00000001-01"
            /dev/sda2: UUID="1f2b3c4d-5e6f-7890-abcd-1234567890ab" TYPE="ext4" PARTUUID="00000002-02"
            /dev/sdb1: UUID="2e7c1f08-a0d4-4690-89c3-4c7be1a9f2d0" TYPE="ext4" PARTUUID="00000003-01"
            /dev/sdc1: UUID="3f8d2a5b-b1e5-5f80-9c4d-5d8cf9c6e3a1" TYPE="ext4" PARTUUID="00000004-01"
            /dev/sdd1: UUID="4a9e3b6c-c2f6-6g91-0d5e-6e9dfad7f4b2" TYPE="ext4" PARTUUID="00000005-01"
            ```

        - Add UUID entries to /etc/fstab:
            ```bash 
            sudo nano /etc/fstab 
            UUID=2e7c1f08-a0d4-4690-89c3-4c7be1a9f2d0  /home  ext4  defaults,nodev,nosuid,noexec  0 2
            UUID=3f8d2a5b-b1e5-5f80-9c4d-5d8cf9c6e3a1  /var   ext4  defaults,nodev,nosuid         0 2
            UUID=4a9e3b6c-c2f6-6g91-0d5e-6e9dfad7f4b2  /tmp   ext4  defaults,nodev,nosuid,noexec  0 2
            ```
            - Save and exit
        
    - Mount all entries 
        ```bash 
        sudo mount -a
        ```
    
4. Verify 

    - Check Mounts:
        ```bash 
        df -h

        # Example output
        Filesystem      Size  Used Avail Use% Mounted on
        /dev/sdb1       2G    50M  1.9G   3%  /home
        /dev/sdc1       2G   200M  1.8G  10%  /var
        /dev/sdd1       2G   100K  1.9G   1%  /tmp
        ```
