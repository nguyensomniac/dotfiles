# Installs Homebrew. Ruby comes preinstalled on Macs
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installs brew-cask
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap homebrew/science

# Install brew packages

brew_apps=(
  cmatrix
  gcc
  git
  #mas
  nvm
  python3
  r
  #reattach-to-user-namespace
  tmux
  zsh
)

brew install "${brew_apps[@]}"

# Install brew-cask packages

cask_apps=(
  atom
  dashlane
  firefox
  flux
  google-chrome
  iterm2-beta
  polymail
  sketch
  slack
  spotify
)

brew cask install "${cask_apps[@]}"

cask_fonts=(
  font-input
  font-karla
  font-source-sans-pro
)

brew cask install "${cask_fonts[@]}"

# Install Mac app store apps - disabled until mas works better with tmux
# mas_apps=(
#   507257563 # Sip
# )
#
# read -p "Enter your Apple ID: " apple_id
# read -sp "Enter your password: " apple_password
# mas signin $apple_id $apple_password

npm_packages=(
  babel
  bower
  coffee-script
  gulp
  react
  redux
  webpack
  yo
)

npm install -g "${npm_packages[@]}"

pip_packages=(
  matplotlib
  pandas
  powerline-status
)

pip3 install "${pip_packages[@]}"

atom_packages=(
  aesthetic-ui
  base16-syntax
  file-icons
  firewatch-syntax
  pigments
  power-mode
  project-manager
  redmond-syntax
  spacegray-dark-syntax
  spacegray-dark-ui
  spacegray-light-syntax
  spacegray-light-ui
  vim-mode
)

apm install "${atom_packages[@]}"

# Install oh-my-zsh
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

if [ $COUNT -eq $MAX_TRIES]; then
  echo "Entered incorrect password too many times. Exiting."
fi
