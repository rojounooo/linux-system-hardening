import os 
import shutil 

#=== SSH Hardening Script ===
# This script modifies the SSH configuration file to enhance security.


# === Variables ===

# Configuration file path
init_config_path = "/etc/sshd/sshd_config"
backup_config_file_path = "/etc/sshd/sshd_config.bak"

# Dictionary of configuration changes
config_changes = {
    "Port 22": "Port 2222",
    "PermitRootLogin yes": "PermitRootLogin no",
    "PubKeyAuthentication": "PubkeyAuthentication yes",
    "PasswordAuthentication yes": "PasswordAuthentication no",
    "AllowTcpForwarding yes": "AllowTcpForwarding no",
    "ClientAliveInterval": "ClientAliveInterval 30",
    "ClientAliveCountMax": "ClientAliveCountMax 2",
    "LogLevel": "LogLevel VERBOSE",
    "MaxAuthTries": "MaxAuthTries 3",
    "MaxSessions": "MaxSessions 2",
    "TCPKeepAlive": "TCPKeepAlive no",
    "X11Forwarding": "X11Forwarding no",
    "AllowAgentForwarding": "AllowAgentForwarding no",
}

# === Functions ===

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
    Reads the SSH configuration file and returns its content.
    """
    try:
        with open(file_path, 'r') as file:
            return file.readlines()
    except Exception as e:
        print(f"Error reading config file: {e}")
        return []

def modify_lines(lines, changes):
    """
    Replaces both active and commented lines with updated config.
    Comment markers (#) are stripped to activate the new config lines.
    """
    updated_lines = []
    applied_keys = set()

    for line in lines:
        modified = False
        stripped_line = line.strip()

        for old, new in changes.items():
            if old in stripped_line:
                applied_keys.add(old)

                # Replace the entire line with the active new line
                updated_lines.append(new + "\n")
                print(f"Replacing: {line.strip()} → {new}")
                modified = True
                break

        if not modified:
            updated_lines.append(line)

    # Add missing settings not found in original file
    for old, new in changes.items():
        if old not in applied_keys:
            updated_lines.append(new + "\n")
            print(f"Adding missing setting: {new}")

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
    print("--- End of Preview ---\n")


def write_config_file(file_path, lines):
    """
    Writes the modified lines back to the SSH configuration file.
    """
    try:
        with open(file_path, 'w') as file:
            file.writelines(lines)
        print(f"Configuration file updated: {file_path}")
    except Exception as e:
        print(f"Error writing config file: {e}")


def main():
    # Read the original config
    lines = read_config_file(init_config_path)

    # Generate modified lines
    modified_lines = modify_lines(lines.copy(), config_changes)

    # Show the preview
    preview_changes(lines, modified_lines)

    # Optional: Confirm before writing
    confirm = input("Apply these changes? [y/N]: ").strip().lower()
    if confirm == 'y':
        write_config_file(init_config_path, modified_lines)
        print("Changes applied.")
    else:
        print("No changes were made.")


if __name__ == "__main__":
    main()