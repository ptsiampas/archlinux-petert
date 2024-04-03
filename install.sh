#!/usr/bin/env bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run with root privileges. Please run it with sudo." >&2
    exit 1
fi

# System-wide installation tasks
./system_install.sh

# Assuming the primary user has UID 1000
primary_user=$(id -un 1000)

# User-specific installation tasks
sudo -u "$primary_user" bash -c './user_install.sh'

echo "Installation process complete."

