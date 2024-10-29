PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# @see wiki.archlinux.jp/index.php/コンソールのカラー出力
alias ip='ip -color=auto'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
if [[ -x `which colordiff` ]]; then
	alias diff='colordiff -u'
else

	alias diff='diff -u'

fi

