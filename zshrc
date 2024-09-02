# Created by newuser for 5.9

autoload -Uz compinit
compinit

autoload -Uz colors
colors

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

  # branch='\ue0a0'
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
    branch_status="${color}${green}${branch}"
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
  echo "${branch_status}$branch_name${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

autoload -Uz colors
colors

PROMPT="${fg[green]}${USER}@${HOST}${reset_color}: ${fg[blue]}%~${reset_color}"$'\n'"$ "
#RPROMPT='`rprompt-git-current-branch`'

setopt hist_ignore_all_dups

alias ip='ip -color=auto'
alias ls='ls --color=auto'
alias diff='diff --color=auto'

GPG_TTY=$(tty)
export GPG_TTY

export LESSCHARSET=utf-8

