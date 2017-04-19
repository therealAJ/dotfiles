# Path to my oh-my-zsh installation.
export ZSH=/Users/alex/.oh-my-zsh

# ZSH THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# PLUGINS
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git dirhistory osx web-search jsontools sublime)

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

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------

alias g='git'
alias pull='git pull'
alias push='git push'
alias gc='git commit -m $1'
alias ga='git add -A'
alias clone='git clone'
# Adds all and commits (gg 'Commit message')
function ggg () {
  git add -A;
  git commit -m "$1";
  git push;
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
alias gs='git status -sb'
alias gd='git diff --color'
alias gdc='git diff --cached'
alias gstat='git diff --stat'
alias log='git log --all --graph --decorate --oneline --abbrev-commit'
alias gitk='gitx --all'

