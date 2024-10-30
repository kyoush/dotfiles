# Created by newuser for 5.9

function precmd() {
	if [ ! -z $TMUX ]; then
		tmux refresh-client -S
	fi
}

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

# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  branch=''
  color='%{\e[38;5;' #  文字色を設定
  green='114m%}'

  red='001m%}'
  yellow='227m%}'
  blue='033m%}'
  reset='%{\e[0m%}'   # reset
  
  [[ ! -e  ".git" ]] && return # .gitリポジトリかどうか判定
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="${color}${green}%}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="${color}${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="${color}${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="${color}${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
  else
    # 上記以外の状態の場合
    branch_status="${color}${blue}${branch}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}${branch_name}${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

autoload -Uz colors
colors

PROMPT="${fg[green]}${USER}@${HOST}${reset_color}: ${fg[blue]}%~${reset_color}"$'\n'"$ "
RPROMPT='`rprompt-git-current-branch`'

setopt hist_ignore_all_dups

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

GPG_TTY=$(tty)

export GPG_TTY
export PAGER=less
export LESSCHARSET=utf-8
export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Load Angular CLI autocompletion.
# source <(ng completion script)

export PATH=~/miniconda3/bin:$PATH
source ~/miniconda3/etc/profile.d/conda.sh

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
