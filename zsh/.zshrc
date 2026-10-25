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
alias d="kitten diff"
alias ff="fastfetch"
alias b="btop"
alias clip="pbcopy"
alias g="git"
alias reboot="sudo shutdown -r now"

alias vim="nvim"
alias v="nvim"

alias gs="git status"
alias gfm="git fetch origin master:master"
alias gmm="git merge master"

alias matrix="cmatrix -C blue -s"
alias python="python3"

source ~/.config/proxy/cloda.sh

source ~/.aliases_k.sh

export PATH="$HOME/.local/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

eval "$(zoxide init zsh)"

# yazi: cd into the last directory on quit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
