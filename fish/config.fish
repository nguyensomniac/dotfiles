set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
set -gx PATH /usr/local/bin $PATH
source ~/.cache/hellwal/variablesfish.fish
sh ~/.cache/hellwal/terminal.sh

starship init fish | source

