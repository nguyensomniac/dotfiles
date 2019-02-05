SCRIPTPATH=$(cd "$(dirname "$1")"; pwd)/$(basename "$1")

# Installs Homebrew. Ruby comes preinstalled on Macs
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installs brew-cask
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap homebrew/science

# Install brew packages

brew_apps=(
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
  sketch
  spotify
)

brew cask install "${cask_apps[@]}"

cask_fonts=(
  font-input
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

atom_packages=(
  activate-power-mode@2.6.0
  aesthetic-ui@4.0.0
  ariake-dark-syntax@0.1.3
  base16-syntax@1.8.1
  emmet@2.4.3
  file-icons@2.1.16
  firewatch-syntax@1.1.1
  language-ejs@0.4.0
  language-elixir@0.20.3
  language-elm@1.5.0
  lunar-syntax@0.1.3
  markdown-writer@2.7.3
  pigments@0.40.2
  power-mode@0.1.3
  project-manager@3.3.5
  rainbow@1.1.0
  react-es6-snippets@0.3.0
  redmond-syntax@1.0.2
  remote-edit@1.9.0
  spacegray-dark-syntax@0.2.0
  spacegray-dark-ui@0.13.0
  spacegray-light-syntax@0.1.0
  spacegray-light-ui@0.1.0
  vim-mode@0.66.0
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

if [ $COUNT -eq $MAX_TRIES ]; then
  echo "Entered incorrect password too many times. Exiting."
fi

# install Antigen bundle manager for zsh
if [ ! -d ~/.zgen ]; then
  echo "Installing Zgen to" $SCRIPTPATH
  mkdir $SCRIPTPATH/.zgen
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen" 
  ln -fs $SCRIPTPATH/.zgen ~/.zgen
fi
