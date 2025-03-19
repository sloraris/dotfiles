#!/bin/bash
##### Setup sloraris mac environment #####


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

    # Activate Homebrew for the current session
    if [[ "$(uname -m)" == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "Homebrew is already installed."
fi

# Ensure Homebrew is up-to-date
brew update

# Install CLI applications
echo "Installing CLI applications..."
brew install "${BREW_APPS[@]}"

# Install GUI applications
echo "Installing GUI applications..."
brew install --cask "${CASK_APPS[@]}"

# Cleanup
brew cleanup
echo "Installation complete!"

# Setup git and ohmyposh
cp ./.gitconfig ~/.gitconfig
cp -r ./.config ~/.

# Copy/replace .zshrc and restart shell environment
cp ./.zshrc ~/.zshrc
source ~/.zshrc

echo "Setup completed."
