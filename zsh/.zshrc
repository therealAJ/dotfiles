# Path to my oh-my-zsh installation.
export ZSH=/Users/alex/.oh-my-zsh

# ZSH THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# PLUGINS
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(dirhistory osx web-search jsontools sublime)

source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------------------
# Custom Functions 
# -------------------------------------------------------------------

#VS CODE

function code {  
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# -------------------------------------------------------------------
# Directory Shortcuts
# -------------------------------------------------------------------

alias p='pwd'

alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# -------------------------------------------------------------------
# PROGRAM PATHS
# -------------------------------------------------------------------

# Anaconda3
export PATH="/Users/alex/anaconda/bin:$PATH"

# -------------------------------------------------------------------
# VIM 
# -------------------------------------------------------------------
alias v='vim'

# -------------------------------------------------------------------
# TMUX 
# -------------------------------------------------------------------
alias tm='tmux'
alias tmk='tmux kill-session'
alias tmks='tmux kill-server'
alias tmkp='tmux kill-pane'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbd='git branch -d'
alias gbv='git branch -v'
alias gc='git commit -m $1'
alias gcb='git checkout -b'
alias clone='git clone'
alias gf='git fetch'
alias gfo='git fetch origin'
alias pull='git pull'
alias push='git push'
alias gs='git status -sb'
alias gd='git diff --color'
alias gdc='git diff --cached'
alias gstat='git diff --stat'
alias glp="_git_log_prettily"
alias log='git log --all --graph --decorate --oneline --abbrev-commit'
alias gitk='gitx --all'
alias gr='git remote'
alias gra='git remote add'
alias grv='git remote -v'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gst='git status'

#
# Functions
#

# Adds all and commits (gg 'Commit message')
function ggg () {
  git add -A;
  git commit -m "$1";
  git push;
}
# Fetch from remote and rebase
function gupdate () {
  git fetch origin master;
  git rebase origin/master;
}
# Create gh pages
function gh () {
  git checkout --orphan gh-pages;
}
# Pushes to gh pages
function ghpush () {
  git checkout gh-pages;
  git rebase master;
  git push origin gh-pages;
  git checkout master;
}
# The list of remotes
function current_repository() {
  if ! $_omz_git_git_cmd rev-parse --is-inside-work-tree &> /dev/null; then
    return
  fi
  echo $($_omz_git_git_cmd remote -v | cut -d':' -f 2)
}
# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
# Warn if the current branch is a WIP
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}
