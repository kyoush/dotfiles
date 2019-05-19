# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\u@\h \W\$\n '

export PATH="/usr/local/bin/x86_64-linux:$PATH"
export HISTSIZE=500000
export HISTFILESIZE=500000
export HISTTIMEFORMAT='%Y/%m/%d %H:%M(%S) : '
export PYTHONPATH=/usr/lib/python3.7/site-packages
export VISUAL="emacs"

neofetch

case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                ;;
            *)
                echo -ne "\033]0;${BASH_COMMAND} - ${PWD##*/}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
	 esac

     powerline-daemon -q
     POWERLINE_BASH_CONTINUARION=1
	 POWERLINE_BASH_SELECT=1
	 . /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

     export PATH="/home/kyoshi/anaconda3/bin:$PATH"

     unset SUDO_UID SUDO_GID SUDO_USER
