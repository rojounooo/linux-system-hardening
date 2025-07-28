#!/usr/bin/env python3

# === Libraries ===
import os
import shutil
import subprocess

#=== Fail2Ban Hardening Script ===
# This script installs Fail2Ban, creates jail.local, and modifies it for SSH security.

# === Variables ===

# Configuration file paths
init_config_path = "/etc/fail2ban/jail.local"
backup_config_file_path = "/etc/fail2ban/jail.local.bak"
jail_conf_path = "/etc/fail2ban/jail.conf"

# Dictionary of configuration changes for [sshd] jail
config_changes = {
    "[sshd]": "[sshd]",
    "enabled": "enabled = true",
    "bantime": "bantime = -1",
    "findtime": "findtime = 300",
    "maxretry": "maxretry = 3",
}

# === Functions ===

def run_command(command):
    """
    Runs a shell command.
    """
    try:
        subprocess.run(command, shell=True, check=True)
        print(f"Command succeeded: {command}")
    except subprocess.CalledProcessError as e:
        print(f"Command failed: {command}\n{e}")

def install_fail2ban():
    """
    Installs Fail2Ban using apt.
    """
    print("Installing Fail2Ban...")
    run_command("sudo apt update -y && sudo apt install fail2ban -y")

def create_jail_local():
    """
    Copies jail.conf to jail.local if jail.local does not exist.
    """
    if not os.path.exists(init_config_path):
        print("Creating jail.local from jail.conf...")
        run_command(f"sudo cp {jail_conf_path} {init_config_path}")
    else:
        print("jail.local already exists.")

def backup_config_file(source, destination):
    """
    Backs up the configuration file from the source to the destination.
    """
    try:
        shutil.copy2(source, destination)
        print(f"Backup successful: {source} -> {destination}")
    except Exception as e:
        print(f"Error during backup: {e}")

def read_config_file(file_path):
    """
    Reads the Fail2Ban configuration file and returns its content.
    """
    if not os.path.exists(file_path):
        print(f"Configuration file not found at {file_path}")
        return []
    try:
        with open(file_path, 'r') as file:
            return file.readlines()
    except Exception as e:
        print(f"Error reading config file: {e}")
        return []

def modify_lines(lines, changes):
    """
    Replaces or adds settings in the jail.local file for [sshd] jail.
    """
    updated_lines = []
    in_sshd_block = False
    applied_keys = set()

    for line in lines:
        stripped_line = line.strip()

        if stripped_line.startswith("[sshd]"):
            in_sshd_block = True
            updated_lines.append(changes["[sshd]"] + "\n")
            applied_keys.add("[sshd]")
            continue

        if in_sshd_block:
            for key, new_setting in changes.items():
                if key != "[sshd]" and stripped_line.startswith(key):
                    updated_lines.append(new_setting + "\n")
                    applied_keys.add(key)
                    break
            else:
                updated_lines.append(line)

            if stripped_line.startswith("[") and not stripped_line.startswith("[sshd]"):
                in_sshd_block = False
        else:
            updated_lines.append(line)

    if "[sshd]" not in applied_keys:
        print("Adding missing [sshd] block with settings.")
        updated_lines.append("\n[sshd]\n")
        for key, new_setting in changes.items():
            if key != "[sshd]":
                updated_lines.append(new_setting + "\n")
                applied_keys.add(key)

    return updated_lines

def preview_changes(original_lines, modified_lines):
    """
    Compares original and modified lines and prints the changes.
    """
    print("\n--- Preview of Changes ---")
    for i, (orig, mod) in enumerate(zip(original_lines, modified_lines)):
        if orig != mod:
            print(f"Line {i+1}:")
            print(f"- Original: {orig.strip()}")
            print(f"+ Modified: {mod.strip()}")
    if len(modified_lines) > len(original_lines):
        print("+ Additional lines added at end of file.")
    print("--- End of Preview ---\n")

def write_config_file(file_path, lines):
    """
    Writes the modified lines back to the configuration file.
    """
    try:
        with open(file_path, 'w') as file:
            file.writelines(lines)
        print(f"Configuration file updated: {file_path}")
    except Exception as e:
        print(f"Error writing config file: {e}")

def main():
    install_fail2ban()
    create_jail_local()

    lines = read_config_file(init_config_path)

    if lines:
        backup_config_file(init_config_path, backup_config_file_path)

    modified_lines = modify_lines(lines.copy(), config_changes)
    preview_changes(lines, modified_lines)

    confirm = input("Apply these changes and restart fail2ban? [y/N]: ").strip().lower()
    if confirm == 'y':
        write_config_file(init_config_path, modified_lines)
        run_command("sudo systemctl restart fail2ban")
        print("Changes applied and Fail2Ban restarted.")
    else:
        print("No changes were made.")

if __name__ == "__main__":
    main()
