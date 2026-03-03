#!/bin/bash

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Install brew packages
brew_apps=(
  gh
  fastfetch
  fish
  hellwal
  starship
)

brew install "${brew_apps[@]}"

# Install brew-cask packages
cask_apps=(
  claude-code
  figma
  figmadaemon
  ghostty
  thebrowsercompany-dia
  spotify
  visual-studio-code
)

brew install --cask "${cask_apps[@]}"

# Set fish as default shell if not already
if ! grep -q "$(which fish)" /etc/shells 2>/dev/null; then
  echo "Adding fish to list of login shells."
  sudo bash -c "echo $(which fish) >> /etc/shells"
fi

if [ "$SHELL" != "$(which fish)" ]; then
  echo "Changing default shell to fish."
  chsh -s "$(which fish)"
fi

# Install fisher package manager for fish
if ! fish -c "type -q fisher" 2>/dev/null; then
  echo "Installing fisher package manager"
  fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
fi

# Install all fisher packages from fish_plugins file
echo "Installing fisher packages from fish_plugins"
fish -c "fisher update"
