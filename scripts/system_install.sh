#!/usr/bin/env bash

echo "Starting system-wide installation tasks..."
# System update and package installation
pacman -Syu --noconfirm
pacman -Sy --needed --noconfirm base-devel git neovim btop python3 unzip openssh flameshot nodejs npm kitty ttf-font-awesome zsh
systemctl enable sshd
systemctl start sshd
echo "System-wide installations complete."

