#!/usr/bin/env bash

echo "Starting system-wide installation tasks..."
# System update and package installation
pacman -Syu --noconfirm
pacman -Sy --needed --noconfirm base-devel git neovim btop python3 unzip openssh flameshot nodejs npm kitty ttf-font-awesome
systemctl enable sshd
systemctl start ssh
echo "System-wide installations complete."

