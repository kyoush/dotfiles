#!/bin/bash

[[ -z ${1} ]] && echo -e "error: input argument missing\nusage: $ ./link.sh i3" && exit

[[ -d /home/${USER}/.config/${1} ]] && echo -e "error: directory existed" && exit

ln -s /home/${USER}/dotfiles/config/${1} /home/${USER}/.config/${1}
echo "link created"

