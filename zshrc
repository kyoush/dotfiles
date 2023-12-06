# Created by newuser for 5.8.1

autoload -Uz colors
colors
PROMPT="${fg[green]}${USER}@${HOST}${reset_color}: ${fg[blue]}%~${reset_color}"$'\n'"$ "

alias ip='ip --color=auto'
alias ls='ls --color=auto'

if [[ ! -n $TMUX ]]; then
	# get the IDs
	ID="`tmux list-sessions`"
	if [[ -z "$ID" ]]; then
		tmux new-session
	fi
	ID="`echo $ID | $PERCOL | cut -d; -f1 `"
	tmux attach-session -t "$ID"
fi

