# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source "${HOME}/.zgen/zgen.zsh"


# if the init script doesn't exist
if ! zgen saved; then
  zgen oh-my-zsh

  # specify plugins here
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/heroku
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/lein
  zgen oh-my-zsh plugins/command-not-found
  zgen oh-my-zsh plugins/osx

  # Syntax highlighting bundle.
  zgen load zsh-users/zsh-syntax-highlighting

  # Load the theme.
  zgen load geometry-zsh/geometry

  # generate the init script from plugins above
  zgen save
fi

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/lily/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias uaws="aws-credential-client -u $(whoami)@uber.com -t push -a us -i developer -r engineering"

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
brew analytics off 2>&1 >/dev/null

# load local zshrc
if [ -r ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi


cn () { CN_PATH="$(/usr/local/lib/node_modules/@uber/change-node/change-node run $@)" && PATH="${CN_PATH:-$PATH}"; } # change-node t.uber.com/change-node

source ~/.profile_corp #https://stack.uberinternal.com/questions/13218/what-is-uber-home-supposed-to-be
