#!/bin/bash

[[ ! -n ${serverlist} ]] && . /home/${USER}/.config/SERVERLIST
[[ ! -n ${github_username} ]] && github_username=$(cat /home/${USER}/.config/GITHUB_USERNAME)
[[ -n ${github_username} ]] && command="curl https://github.com/${github_username}.keys -o ~/.ssh/authorized_keys" || exit 1

for server in ${serverlist[@]}; do
	echo "exec on $server"
	ssh $server $command
done

