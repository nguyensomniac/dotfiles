SCRIPTPATH=$(cd "$(dirname "$1")"; pwd)/$(basename "$1")

# Installs Homebrew. Ruby comes preinstalled on Macs
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Installs brew-cask
brew tap homebrew/cask
brew tap homebrew/cask-versions

# Install brew packages

brew_apps=(
  tmux
  zsh
)

brew install "${brew_apps[@]}"

# Install brew-cask packages

cask_apps=(
  arc
  figma
  figmadaemon
  spotify
)

brew install --cask "${cask_apps[@]}"

cask_fonts=(
  font-geist-mono
)

brew install --cask "${cask_fonts[@]}"

# Install Mac app store apps - disabled until mas works better with tmux
# mas_apps=(
#   507257563 # Sip
# )
#
# read -p "Enter your Apple ID: " apple_id
# read -sp "Enter your password: " apple_password
# mas signin $apple_id $apple_password

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# Change default shell to zsh
echo "Adding zsh to list of login shells."
MAX_TRIES=4
COUNT=0
while [  $COUNT -lt $MAX_TRIES ]; do
  sudo bash -c "echo $(which zsh) >> /etc/shells"
  if [ $? -eq 0 ]; then
    break
  fi
  let COUNT=COUNT+1
done

if [ $COUNT -eq $MAX_TRIES ]; then
  echo "Entered incorrect password too many times. Exiting."
fi

echo "Changing default shell to zsh."
MAX_TRIES=4
COUNT=0
while [  $COUNT -lt $MAX_TRIES ]; do
  chsh -s $(which zsh)
  if [ $? -eq 0 ]; then
    break
  fi
  let COUNT=COUNT+1
done

if [ $COUNT -eq $MAX_TRIES ]; then
  echo "Entered incorrect password too many times. Exiting."
fi

ln -fs $SCRIPTPATH/.zshrc ~/.zshrc

# install Antigen bundle manager for zsh
if [ ! -d ~/.zgen ]; then
  echo "Installing Zgen to" $SCRIPTPATH
  mkdir $SCRIPTPATH/.zgen
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen" 
  ln -fs $SCRIPTPATH/.zgen ~/.zgen
fi
