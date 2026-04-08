set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
set -gx PATH /usr/local/bin $PATH

# Load Node LTS via nvm.fish (only if node not already available)
if not type -q node
    nvm use --silent lts >/dev/null 2>&1
end

# Add user-maintained functions to function path
set -gp fish_function_path ~/.config/fish/functions/user_maintained

source ~/.cache/hellwal/variablesfish.fish
sh ~/.cache/hellwal/terminal.sh

# Set git abbreviations
abbr ga "git add"
abbr gaa "git add --all"
abbr "gbc!" "git for-each-ref --format '%(refname:short) %(upstream:track)' | awk '$2 == \"[gone]\" {print $1}' | xargs -r git branch -D"
abbr gbd "git branch -D"
abbr gbl "git branch -l"
abbr gbm "git branch -m"
abbr "gc!" "git commit --amend"
abbr gca "git commit --all"
abbr "gca!" "git commit --all --amend"
abbr gcam "git commit --all -m"
abbr gcb "git checkout -b"
abbr gcmsg "git commit -m"
abbr "gcn!" "git commit --no-edit --amend"
abbr gco "git checkout"
abbr gcp "git cherry-pick"
abbr gd "git diff"
abbr gds "git diff --staged"
abbr ggpull "git pull"
abbr ggpush "git push -u origin (git rev-parse --abbrev-ref HEAD)"
abbr gl "git pull --rebase"
abbr gm "git merge"
abbr gmt "git mergetool"
abbr gpf "git push --force"
abbr "gpf!" "git add --all && git commit --no-edit --amend && git push --force"
abbr grb "git rebase"
abbr grba "git rebase --abort"
abbr grbc "git rebase --continue"
abbr grbi "git rebase -i"
abbr grbs "git rebase --skip"
abbr gst "git status"
abbr gsta "git stash -u"
abbr gstp "git stash pop"

# Implicit cd for bare directory names
function fish_command_not_found
    if test -d $argv[1]
        cd $argv[1]
    else
        __fish_default_command_not_found_handler $argv
    end
end

# General abbreviations
abbr l "ls"
abbr cdsp "claude --dangerously-skip-permissions"

# Bash-like abbreviations
abbr ... "cd ../.."
abbr --add !! --position anywhere --function last_history_item
abbr --add '$' --regex '\!\$$' --position anywhere --function last_history_arg

starship init fish | source

