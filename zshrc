# Created by newuser for 5.9

function export_variables() {
	export LANG=C
	export GPG_TTY
	export PAGER=less
	export LESSCHARSET=utf-8
	export LC_ALL=C.UTF-8
	export LANG=C.UTF-8
	export SCREENRC="~/.screenrc"
}

function export_token() {
	tokens=( \
		"GITHUB_TOKEN" \
		"GITLAB_TOKEN" \
		"GITLAB_COM_TOKEN" \
	)

	token_path="/home/${USER}/.config/"

	for token in "${tokens[@]}"; do
		if [[ -r "${token_path}${token}" ]]; then
			export ${token}=$(cat "${token_path}${token}")
		fi
	done
}

function setup_alias() {
	# tmux utf-8 mode
	alias tmux='tmux -u'

	# refresh timeout @see wiki.archlinux.jp/index.php/Sudo
	alias sudo='sudo -v; sudo '

	# @see wiki.archlinux.jp/index.php/コンソールのカラー出力
	alias ip='ip -color=auto'
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	if [[ -x `which colordiff` ]]; then
		alias diff='colordiff -u'
	else
		alias diff='diff -u'
	fi
}

function precmd() {
	if [ ! -z $TMUX ]; then
		tmux refresh-client -S
	fi
}

function setup_tmux() {
	if [[ ! -n "$SSH_CONNECTION" ]]; then
		if [[ ! -n $TMUX ]]; then
			# get the IDs
			ID="`tmux list-sessions`"
			if [[ -z "$ID" ]]; then
				tmux new-session
			fi
			ID="`echo $ID | $PERCOL | cut -d: -f1`"
			tmux attach-session -t "$ID"
		fi
	fi
}

function setup_zsh() {
	autoload -Uz compinit
	compinit

	autoload -Uz colors
	colors

	zstyle ':completion:*' menu select

	### Added by Zinit's installer
	if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
		print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
		command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
		command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
			print -P "%F{33} %F{34}Installation successful.%f%b" || \
			print -P "%F{160} The clone has failed.%f%b"
	fi

	source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
	autoload -Uz _zinit
	(( ${+_comps} )) && _comps[zinit]=_zinit


	# Load a few important annexes, without Turbo
	# (this is currently required for annexes)
	zinit light-mode for \
		zdharma-continuum/zinit-annex-as-monitor \
		zdharma-continuum/zinit-annex-bin-gem-node \
		zdharma-continuum/zinit-annex-patch-dl \
		zdharma-continuum/zinit-annex-rust

	### End of Zinit's installer chunk

	zinit ice pick"async.zsh" src"pure.zsh"
	zinit light sindresorhus/pure

	zinit ice wait'!0'
	#zinit light zdharma/fast-syntax-highlighting
	zinit light zsh-users/zsh-autosuggestions
	zinit light zsh-users/zsh-completions

	zinit ice as"completion"
	zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

	zinit ice as"completion"
	zinit snippet https://github.com/docker/compose/blob/v1/contrib/completion/zsh/_docker-compose
}

function setup_docker() {
	# for docker completions
	# @see https://docs.docker.com/engine/cli/completion/#zsh
	fpath=(~/.docker/completions $fpath)
}

function setup_nodejs() {
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function setup_miniconda() {
	[[ -d "/home/${USER}/miniconda3/bin" ]] && export PATH=~/miniconda3/bin:$PATH
	[[ -r "/home/${USER}/miniconda3/etc/profile.d/conda.sh" ]] && source ~/miniconda3/etc/profile.d/conda.sh
}

function main() {
	# PROMPT="${fg[green]}${USER}@${HOST}${reset_color}: ${fg[blue]}%~${reset_color}"$'\n'"$ "
	HISTFILE=${HOME}/.zsh_history
	HISTSIZE=50000
	SAVEHIST=50000
	GPG_TTY=$(tty)

	setopt prompt_subst
	setopt hist_ignore_all_dups

	export_variables
	export_token

	setup_alias
	setup_zsh
	setup_tmux

	setup_docker
	setup_nodejs
	setup_miniconda
}

main
