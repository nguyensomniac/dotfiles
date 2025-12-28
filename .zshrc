# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source "${HOME}/.zgen/zgen.zsh"


# if the init script doesn't exist
if ! zgen saved; then
  zgen oh-my-zsh

  # specify plugins here
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/lein
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/macos

  # Syntax highlighting bundle.
  zgen load zsh-users/zsh-syntax-highlighting

  # Autosuggestions
  zgen load zsh-users/zsh-autosuggestions

  # Load the theme.
  # zgen load geometry-zsh/geometry

  # generate the init script from plugins above
  zgen save
fi

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# User configuration

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"


# Better completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"     # Colored completion


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Useful aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ll="ls -lah"
alias ..="cd .."
alias ...="cd ../.."
alias grep="grep --color=auto"

# History settings
HISTSIZE=50000
SAVEHIST=50000
setopt EXTENDED_HISTORY          # Write timestamp to history file
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first
setopt HIST_IGNORE_DUPS          # Don't record duplicate entries
setopt HIST_IGNORE_SPACE         # Don't record commands starting with space
setopt HIST_VERIFY               # Show command with history expansion before running
setopt SHARE_HISTORY             # Share history between sessions

# Directory navigation
setopt AUTO_CD              # cd by typing directory name
setopt AUTO_PUSHD           # Push directories onto stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates
setopt PUSHD_SILENT         # Don't print directory stack

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'


function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
eval "$(/opt/homebrew/bin/brew shellenv)"
# Note: brew analytics is already disabled, no need to run on every startup

# load local zshrc
if [ -r ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi


export NVM_DIR="$HOME/.nvm"
# Lazy load nvm for faster shell startup
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm "$@"
}

eval "$(starship init zsh)"

