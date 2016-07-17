# Installs Homebrew. Ruby comes preinstalled on Macs
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installs brew-cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

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
  google-chrome
  spotify
)

brew-cask install "${cask_apps[@]}"

npm_packages=(
  babel
  bower
  coffee-script
  gulp
  react
  redux
  yo
)

npm install -g "${npm_packages[@]}"
