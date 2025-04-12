# Sloraris MacOS Setup Script

This script automates the setup of a new MacOS environment with my preferred applications and configurations.

## Quick Start

To set up a new MacOS environment, run this single command in your terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sloraris/dotfiles/main/slo.sh)"
```

## Requirements

- MacOS
- Internet connection
- Administrator privileges (for Homebrew installation)

## What Does It Install?

### CLI Applications
- git
- oh-my-posh
- sanesidebuttons
- notunes
- zsh
- pyenv

### GUI Applications (Casks)
- font-meslo-lg-nerd-font
- warp
- opera@developer
- etcher
- obsidian
- raspberry-pi-imager
- raycast

## What Does It Configure?

The script will:
1. Install Homebrew if not already installed
2. Install the listed CLI and GUI applications
3. Download and configure:
   - `.gitconfig`
   - `.zshrc`
   - oh-my-posh custom theme

## Post-Installation

After the script completes:
1. Restart your terminal
2. OR run `source ~/.zshrc` to apply the new configuration
3. Setup individual applications

## Application configuration

- Warp:
  - Set prompt to `oh-my-posh`
  - Set input position
  - Set font to `Meslo LGS Nerd Font Mono`
  - Set `Use thin strokes` to `Never`
  - Set theme

- Sanesidebuttons:
  - Allow permissions
  - Hide status bar icon

- Notunes:
  - Hide status bar icon

## Troubleshooting

If you encounter any issues:
1. Check your internet connection
2. Ensure you have administrator privileges
3. Check the terminal output for specific error messages
4. If a specific application fails to install, you can try installing it manually using:
   ```bash
   brew install <application-name>
   # or for GUI applications
   brew install --cask <application-name>
   ```

## Contributing

Feel free to fork this repository and modify the script for your own use.

## License

[MIT License](LICENSE)
