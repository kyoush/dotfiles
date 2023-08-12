# Created by newuser for 5.8.1

autoload -Uz colors
colors

autoload -Uz compinit
compinit

PROMPT="${fg[green]}${USER}@${HOST}${reset_color}: ${fg[blue]}%~${reset_color}"$'\n'"$ "

alias ip='ip --color=auto'
alias ls='ls --color=auto'

