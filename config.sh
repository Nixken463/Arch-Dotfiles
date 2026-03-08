#!/bin/bash

setup_configs() {
    echo "Setting up configs..."

    DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    CONFIG_DIR="$HOME/.config"

    mkdir -p "$CONFIG_DIR"

    declare -A configs=(
        ["bat"]="$CONFIG_DIR/bat"
        ["fish"]="$CONFIG_DIR/fish"
        ["kitty"]="$CONFIG_DIR/kitty"
        ["nvim"]="$CONFIG_DIR/nvim"
        ["yazi"]="$CONFIG_DIR/yazi"
        ["cava"]="$CONFIG_DIR/cava"
        ["fastfetch"]="$CONFIG_DIR/fastfetch"
        ["hypr"]="$CONFIG_DIR/hypr"
        ["simple-sddm"]="/usr/share/sddm/themes/simple-sddm"
        ["noctalia"]="$HOME/.noctalia"
    )

    for config in "${!configs[@]}"; do
        source_path="$DOTFILES_DIR/$config"
        target_path="${configs[$config]}"

        if [[ ! -e "$source_path" ]]; then
            echo "Skipping $config (not found)"
            continue
        fi

        if [[ "$config" == "simple-sddm" ]]; then
            echo "Installing SDDM theme..."

            sudo mkdir -p "$(dirname "$target_path")"
            sudo ln -sfn "$source_path" "$target_path"

            sudo mkdir -p /etc/sddm.conf.d
            echo -e "[Theme]\nCurrent=$(basename "$target_path")" | \
                sudo tee /etc/sddm.conf.d/theme.conf.user > /dev/null
            sudo systemctl enable sddm
        else
            echo "Symlinking $config → $target_path"
            mkdir -p "$(dirname "$target_path")"
            ln -sfn "$source_path" "$target_path"
        fi
    done

    echo "Configs symlinked successfully!"
}
