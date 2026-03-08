#!/bin/bash
set -e  # Exit on error

# Detect the directory where this script lives
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Import other scripts
source "$DOTFILES_DIR/packages.sh"
source "$DOTFILES_DIR/config.sh"

# Main installation function
main() {
    echo "Starting dotfiles setup..."

    # Step 1: Install packages
    if ! install_packages; then
        echo "Package installation failed. Check errors above."
        exit 1
    fi

    # Step 2: Symlink configs
    if ! setup_configs; then
        echo "Config symlinking failed. Check errors above."
        exit 1
    fi

    # Step 3: Post-install messages
    echo ""
    echo "✅ Dotfiles setup complete!"
    echo ""
    echo "Next steps:"
    echo "- Restart your system or reload services (e.g., 'systemctl restart sddm')."
    echo "- For shell changes (e.g., fish), run 'chsh -s /usr/bin/fish'."
    echo "- Review any backed-up configs in ~/.config/*.bak or similar."
}

# Run main function
main
