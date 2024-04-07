#!/usr/bin/env bash

echo "Starting user-specific installation tasks..."

# Check and install yay if not present
if ! command -v yay &> /dev/null; then
    echo "yay was NOT located, installing..."
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    makepkg -si --noconfirm
    cd .. && rm -rf yay
else
    echo "yay was located, moving on."
fi

# Install packages with yay
EDITOR=true yay -S floorp-bin autojump thorium-browser-bin --noconfirm --needed

# Install fonts
mkdir -p ~/.fonts
for font in FiraCode Meslo; do
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/${font}.zip"
    unzip "${font}.zip" -d ~/.fonts
    rm "${font}.zip"
done
fc-cache -vf

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors || exit
./install.sh
cd .. && rm -rf Nordzy-cursors

# Install Oh My Zsh and Powerlevel10k
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc --skip-chsh
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
else
    echo "oh-my-zsh was located, moving on."
fi

# Backup and replace .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.old"
fi
#ln -s ${PWD}/dotfiles/zshrc "$HOME/.zshrc"
#ln -s ${PWD}/dotfiles/p10k.zsh "$HOME/.p10k.zsh"

# Setup Neovim
git clone https://github.com/ptsiampas/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

echo "User-specific installations complete."

