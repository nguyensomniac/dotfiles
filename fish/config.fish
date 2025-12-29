set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
set -gx PATH /usr/local/bin $PATH
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
abbr gcm "git commit -m"
abbr "gcn!" "git commit --no-edit --amend"
abbr gco "git checkout"
abbr gcp "git cherry-pick"
abbr gd "git diff"
abbr gds "git diff --staged"
abbr gl "git pull --rebase"
abbr gm "git merge"
abbr gmt "git mergetool"
abbr gpc "git push -u origin (git rev-parse --abbrev-ref HEAD)"
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

starship init fish | source

