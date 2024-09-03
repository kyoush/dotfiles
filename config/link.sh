#!/bin/bash

[[ -z ${1} ]] && echo -e "error: input argument missing\nusage: $ ./link.sh i3" && exit

[[ -d /home/${USER}/.config/${1} ]] && echo -e "error: directory existed" && exit

if [[ ! -d /home/${USER}/.config ]]; then
    echo "WARNING: .config dir does not exist. creating...";
    mkdir "/home/${USER}/.config"
fi

ln -s /home/${USER}/dotfiles/config/${1} /home/${USER}/.config/${1}
echo "Success: link created"
