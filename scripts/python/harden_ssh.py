import re 

# === Variables ===

config_file = "/etc/ssh/sshd_config" # Path to the SSH configuration file
backup_file = "/etc/ssh/sshd_config.bak" # Path to the SSH configuration backup file should be saved
new_port = 2222 # Change to your desired port

# === Functions ===

def backup_config():
    """Backup the SSH configuration file."""
    try:
        with open(config_file, 'r') as original:
            data = original.read()
        with open(backup_file, 'w') as backup:
            backup.write(data)
        print(f"Backup created at {backup_file}")
    except Exception as e:
        print(f"Error creating backup: {e}")
    except FileNotFoundError:
        print(f"Configuration file {config_file} not found.")

def change_ssh_port(config_file, new_port):
    # Read the current config file
    with open(config_file, 'r') as file:
        data = file.read()

    # Define the regex pattern to match lines starting with "Port" followed by a number
    pattern = r"^#?\s*Port\s+\d+"

    # Replacement string
    replacement = f"Port {new_port}"

    # Use re.sub with MULTILINE flag to replace all matching lines
    new_data, count = re.subn(pattern, replacement, data, flags=re.MULTILINE)

    # If no line matched, append new Port line at end
    if count == 0:
        new_data += f"\n{replacement}\n"

    # Write updated config back
    with open(config_file, 'w') as file:
        file.write(new_data)

    print(f"SSH port changed to {new_port} (changed {count} line{'s' if count!=1 else ''})")

def disable_root_login(config_file):
    """Disable root login via SSH."""
    with open(config_file, 'r') as file:
        data = file.read()

    # Define the regex pattern to match lines starting with "PermitRootLogin"
    pattern = r"^#?\s*PermitRootLogin\s+\w+"

    # Replacement string
    replacement = "PermitRootLogin no"

    # Use re.sub with MULTILINE flag to replace all matching lines
    new_data, count = re.subn(pattern, replacement, data, flags=re.MULTILINE)

    # If no line matched, append new PermitRootLogin line at end
    if count == 0:
        new_data += f"\n{replacement}\n"

    # Write updated config back
    with open(config_file, 'w') as file:
        file.write(new_data)

    print(f"Root login disabled (changed {count} line{'s' if count!=1 else ''})")

def enable_key_auth(config_file):
    # Enable key-based authentication by ensuring the following lines are present
    with open(config_file, 'r') as file:
        data = file.read()
    
    # Define the regex pattern to match lines starting with "PubkeyAuthentication"
    pattern = r"^#?\s*PubkeyAuthentication\s+\w+"
    
    # Replacement String
    replacement = "PubkeyAuthentication yes"

    # Use re.sub with MULTILINE flag to replace all matching lines
    new_data, count = re.subn(pattern, replacement, data, flags=re.MULTILINE)


    # If no line matched, append new PubkeyAuthentication line at end
    if count == 0:
        new_data += f"\n{replacement}\n"

    # Write updated config back
    with open(config_file, 'w') as file:
        file.write(new_data)

    print(f"Key-based authentication enabled (changed {count} line{'s' if count!=1 else ''})")

def disable_password_auth(config_file):
    # Disable password authentication.
    with open(config_file, 'r') as file:
        data = file.read()

    # Define the regex pattern to match lines starting with "PasswordAuthentication"
    pattern = r"^#?\s*PasswordAuthentication\s+\w+"

    # Replacement string
    replacement = "PasswordAuthentication no"

    # Use re.sub with MULTILINE flag to replace all matching lines
    new_data, count = re.subn(pattern, replacement, data, flags=re.MULTILINE)

    # If no line matched, append new PasswordAuthentication line at end
    if count == 0:
        new_data += f"\n{replacement}\n"

    # Write updated config back
    with open(config_file, 'w') as file:
        file.write(new_data)

    print(f"Password authentication disabled (changed {count} line{'s' if count!=1 else ''})")

# === Main Execution ===
if __name__ == "__main__":
    backup_config()
    change_ssh_port(config_file, new_port)
    disable_root_login(config_file)
    enable_key_auth(config_file)
    disable_password_auth(config_file)
    print("SSH hardening completed. Please restart the SSH service to apply changes using the command \"sudo systemctl restart sshd\".")