export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lambda"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 42

# PROMPT='> '

DISABLE_AUTO_TITLE="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias q="exit"
alias c="clear"
alias l="ls -al -h"
alias zc="nvim ~/.zshrc"
alias zs="source ~/.zshrc"
alias y="yazi"
alias d="kitten diff"
alias ff="fastfetch"
alias b="btop"
alias cat="bat -n -A"
alias clip="pbcopy"
alias g="git"

alias vim="nvim"
alias v="nvim"

alias gs="git status"

export PATH="$HOME/.local/bin:$PATH"
