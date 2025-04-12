#!/bin/bash
##### Setup sloraris mac environment #####

# Exit on any error
set -e

# List of applications to install
BREW_APPS=(
    git
    oh-my-posh
    sanesidebuttons
    notunes
    zsh
    pyenv
)

CASK_APPS=(
    font-meslo-lg-nerd-font
    warp
    opera@developer
    etcher
    obsidian
    raspberry-pi-imager
    raycast
)

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH permanently
    if [[ "$(uname -m)" == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "Homebrew is already installed."
fi

# Ensure Homebrew is up-to-date
brew update

# Install CLI applications
echo "Installing CLI applications..."
for app in "${BREW_APPS[@]}"; do
    if brew install "$app"; then
        echo "Successfully installed $app"
    else
        echo "Failed to install $app"
    fi
done

# Install GUI applications
echo "Installing GUI applications..."
for app in "${CASK_APPS[@]}"; do
    if brew install --cask "$app"; then
        echo "Successfully installed $app"
    else
        echo "Failed to install $app"
    fi
done

# Cleanup
brew cleanup
echo "Installation complete!"

# Create temporary directory for dotfiles
TEMP_DIR=$(mktemp -d)
DOTFILES_REPO="https://raw.githubusercontent.com/sloraris/dotfiles/main"

# Download dotfiles
echo "Downloading dotfiles..."
curl -fsSL "$DOTFILES_REPO/.gitconfig" -o "$TEMP_DIR/.gitconfig" || echo "Warning: Failed to download .gitconfig"
curl -fsSL "$DOTFILES_REPO/.zshrc" -o "$TEMP_DIR/.zshrc" || echo "Warning: Failed to download .zshrc"

# Copy downloaded files to home directory
if [ -f "$TEMP_DIR/.gitconfig" ]; then
    cp "$TEMP_DIR/.gitconfig" ~/.gitconfig
    echo "Installed .gitconfig"
fi

if [ -f "$TEMP_DIR/.zshrc" ]; then
    cp "$TEMP_DIR/.zshrc" ~/.zshrc
    echo "Installed .zshrc"
fi

# Download oh-my-posh theme
echo "Downloading oh-my-posh theme..."
mkdir -p ~/.config/ohmyposh
curl -fsSL "$DOTFILES_REPO/.config/ohmyposh/slo.yml" -o ~/.config/ohmyposh/slo.yml || echo "Warning: Failed to download oh-my-posh theme"

# Cleanup temporary directory
rm -rf "$TEMP_DIR"

echo "Setup completed. Please restart your terminal or run 'source ~/.zshrc' manually."
