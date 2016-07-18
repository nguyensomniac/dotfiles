# Installs Homebrew. Ruby comes preinstalled on Macs
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installs brew-cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew tap caskroom/fonts

# Install brew packages

brew_apps=(
  cmatrix
  gcc
  git
  nvm
  python3
  r
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
sudo -s
echo $(which zsh) >> /etc/shells
exit
chsh -s $(which zsh)
