#!/usr/bin/env bash

# Wait for monitors to initialize
while ! hyprctl monitors >/dev/null 2>&1; do
    sleep 0.5
done

# Check for eDP-1
if hyprctl monitors | grep -q "eDP-1"; then
    hyprctl keyword source ~/Arch-Dotfiles/hypr/laptop.conf
else
    # Check for gaming vs. programming (optional)
    if [ -f ~/Arch-Dotfiles/hypr/gaming.conf ]; then
        hyprctl keyword source ~/Arch-Dotfiles/hypr/gaming.conf
    else
        hyprctl keyword source ~/Arch-Dotfiles/hypr/programming.conf
    fi
fi
