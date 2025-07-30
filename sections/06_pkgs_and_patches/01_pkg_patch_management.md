# Managing Patches and Packages

## Steps 

1. Keep System Up to Date: 

    - Run the following commands regularly or automate via cron
    ```bash 
    sudo apt update
    sudo apt upgrade -y
    sudo apt full-upgrade -y  # Optional: upgrades kernel and dependencies
    sudo apt autoremove -y    # Cleans up unused packages
    ```

2. Verify Package Integrity

    - `debsums` checks whether the installed files from Debian/Ubuntu packages have been altered or corrupted by comparing them against the original checksums from .deb files.
    ```bash
    sudo apt install debsums -y
    sudo debsums -s
    ```

3. Patch Management Visibility

    - `apt-show-versions` displays the installed and available versions of packages, helping you identify which ones are outdated.
    ```bash
    sudo apt install apt-show-versions -y
    apt-show-versions | grep upgradeable
    ```

4. Monitor Critical Bugs and Changes

    - `apt-listchanges` shows changelogs for packages being upgraded, keeping you informed about new features or breaking changes.
    ```bash
    sudo add-apt-repository universe
    sudo apt update
    sudo apt install apt-listchanges -y
    ```

5. Remove Unused or Unnecessary Software

    - Unused packages can increase attack surface and consume disk space. Remove them with:
    ```bash
    sudo apt autoremove --purge -y        # Removes unused dependencies
    sudo apt purge <package-name>         # Removes a specific package
    apt-mark showmanual                   # Show manually installed packages
    ```
