#!/usr/bin/env bash

echo "Starting user-specific installation tasks..."

# User-specific operations, for example:
mkdir -p ~/github && cd ~/github
git clone https://aur.archlinux.org/yay.git
cd yay || exit
makepkg -si --noconfirm
cd .. && rm -rf yay

echo "User-specific installations complete."

