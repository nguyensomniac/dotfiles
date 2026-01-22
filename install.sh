SCRIPTPATH=$(cd "$(dirname "$1")"; pwd)/$(basename "$1")

# Installs Homebrew. Ruby comes preinstalled on Macs
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Installs brew-cask
brew tap homebrew/cask
brew tap homebrew/cask-versions

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

# Change default shell to fish
echo "Adding fish to list of login shells."
MAX_TRIES=4
COUNT=0
while [  $COUNT -lt $MAX_TRIES ]; do
  sudo bash -c "echo $(which fish) >> /etc/shells"
  if [ $? -eq 0 ]; then
    break
  fi
  let COUNT=COUNT+1
done

if [ $COUNT -eq $MAX_TRIES ]; then
  echo "Entered incorrect password too many times. Exiting."
fi

echo "Changing default shell to fish."
MAX_TRIES=4
COUNT=0
while [  $COUNT -lt $MAX_TRIES ]; do
  chsh -s $(which fish)
  if [ $? -eq 0 ]; then
    break
  fi
  let COUNT=COUNT+1
done

if [ $COUNT -eq $MAX_TRIES ]; then
  echo "Entered incorrect password too many times. Exiting."
fi

# Install fisher package manager for fish
echo "Installing fisher package manager"
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"

# Install all fisher packages from fish_plugins file
echo "Installing fisher packages from fish_plugins"
fish -c "fisher update"
