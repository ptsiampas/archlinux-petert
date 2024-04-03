#!/usr/bin/env bash

echo "Starting user-specific installation tasks..."

#### Check for yay ####
ISYAY=/sbin/yay
if [ -f "$ISYAY" ]; then 
    echo -e "yay was located, moving on."
else 
    echo -e "Yay was NOT located installing"
    git clone https://aur.archlinux.org/yay.git &>> $INSTLOG
    cd yay
    makepkg -si --noconfirm &>> ../$INSTLOG
    cd .. && rm -rf yay

fi
echo "User-specific installations complete."

