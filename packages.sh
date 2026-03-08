#!/bin/bash
install_packages() {
    echo "Installing packages..."

    # Update system first
    sudo pacman -Syu --noconfirm

    # List of packages to install
    packages=(
        git 
        gcc #c compiler
        curl 
        wget
        python
        eza 
        fzf 
        bat
        ripgrep
        base-devel  # Required for building AUR packages
        neovim
        discord
        zip
        unzip
        firefox
        kitty
        thunar
        ttf-jetbrains-mono-nerd
        steam
        btop
        obsidian
        obs
        yazi
        syncthing
        cliphist
        hyprland
        wl-clipboard
        #for sddm theme
        sddm
        qt5-quickcontrols2
        qt5-graphicaleffects
        qt5-svg
    )

    for pkg in "${packages[@]}"; do
        if ! sudo pacman -S --noconfirm "$pkg"; then
            echo "Failed to install $pkg. Continuing..."
        fi
    done

    # Install yay (AUR helper)
    if ! command -v yay &> /dev/null; then
        echo "Installing yay..."
        sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    fi

    # AUR packages (using yay)
    aur_packages=(
        # Example: spotify visual-studio-code-bin
        noctalia-shell
        jellyfin-desktop
        onlyoffice-bin

    )

    if command -v yay &> /dev/null; then
        for aur_pkg in "${aur_packages[@]}"; do
            if ! yay -S --noconfirm "$aur_pkg"; then
                echo "Failed to install $aur_pkg. Continuing..."
            fi
        done
    else
        echo "yay not installed. Skipping AUR packages."
    fi

    # Install Bun
    if ! curl -fsSL https://bun.sh/install | bash; then
        echo "Failed to install Bun. Continuing..."
    fi
  }

