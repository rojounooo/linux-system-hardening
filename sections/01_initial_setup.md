### Lab Setup

## 📖 Overview
This document provides step-by-step instructions to set up the linux-system-hardening lab. 

## 📋 Prerequisites

- Operating System - Windows/MacOS/Linux
- User Permissions - Admin/Root 

- Virtual Machine Minimum Requirements:
    - VCPU: 1 Cores
    - RAM: 1GB 
    - Disk Space: 8GB
    - Network: Bridged Adapter

- Virtual Machine Recommended Requirements:
    - VCPU: 4 Cores 
    - RAM: 4GB 
    - Disk Space: 25GB
    - Network: Bridged Adapter

Software Version:
- Python: 13-x
- Lynis: Latest Version
- Virtualisation: VirtualBox (recommended) / VMWare
- Git: Latest Version

## 🚀 Setup Instructions

- 1️⃣ Install Virtualization Software  
  - For Windows, Mac, Linux:  
    - Download and install one of the following:  
      - [VirtualBox](https://www.virtualbox.org/wiki/Downloads) (Free and Open Source)  
      - [VMWare Workstation Player](https://www.vmware.com/products/workstation-player.html) (Free for non-commercial use)  
    - Ensure virtualisation (VT-x/AMD-V) is enabled in your BIOS/UEFI settings.

- 2️⃣ Download a Linux ISO Image  
  - Download the latest Ubuntu Server LTS:  
    [Server ISO](https://ubuntu.com/download/server)

- 3️⃣ Create a New Virtual Machine  
  - Open your virtualization software and create a new VM:  
    - Name: `linux-system-hardening-lab`  
    - Type: Linux  
    - Version: Ubuntu (64-bit)  
    - Allocate resources based on your system:  
      - CPU: 1–4 cores  
      - RAM: 1–4 GB  
      - Disk: 8–25 GB (dynamically allocated preferred)  
    - Attach the downloaded ISO as the boot device  
    - Set the network adapter to Bridged Adapter for internet access

- 4️⃣ Install the Linux Operating System  
  - Start the VM and follow the on-screen instructions to install the OS.  
  - Create a user account with sudo privileges.  
    - Note down the credentials   
  - Once installation completes, reboot into your new system.

- 5️⃣ Update the System  
  - Log into your VM and run:  
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

- 6️⃣ Install Required Tools  
  - Install Python, Git, and Lynis:  
    ```bash
    sudo apt install python3 python3-pip git lynis -y
    ```  
  - Confirm installations:  
    ```bash
    python3 --version
    git --version
    lynis --version
    ```

- 7️⃣ Clone the Lab Repository  
  - Clone the lab repository to your VM:  
    ```bash
    git clone https://github.com/rojounooo/linux-system-hardening.git
    cd linux-system-hardening
    ```  
  - View the hardening checklist:  
    ```bash
    cat checklist.md
    ```  
  - For each checklist section in order, use the dedicated `.md` files in `sections/` to follow the hardening steps.

---

[Back to Lab Overview](../README.md)

After completing the initial setup, proceed to the [checklist.md](../checklist.md) for step-by-step hardening tasks.
