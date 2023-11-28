# Created by newuser for 5.9

export LANG=C

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

if [[ ! -n $TMUX ]]; then
	# get the IDs
	ID="`tmux list-sessions`"
	if [[ -z "$ID" ]]; then
		tmux new-session
	fi
	ID="`echo $ID | $PERCOL | cut -d: -f1`"
	tmux attach-session -t "$ID"
fi

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

autoload -Uz colors
colors

PROMPT="${fg[green]}${USER}@${HOST}${reset_color}: ${fg[blue]}%~${reset_color}"$'\n'"$ "

alias ip='ip -color=auto'
alias ls='ls --color=auto'

if [[ -x `which colordiff` ]]; then
	alias diff='colordiff -u'
else
	alias diff='diff -u'
fi

GPG_TTY=$(tty)
export GPG_TTY

export PAGER=less

export LESSCHARSET=utf-8

