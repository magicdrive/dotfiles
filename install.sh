#! /bin/bash

#
# install dotfiles
#

execdatetime=$(date +%Y-%m-%d_%H:%M:%S)
cur_dir=$(pwd)

## dotfiles list

zsh_files=( '.zsh' '.zshrc' '.zshenv' );
tmux_files=( '.tmux.conf' '.tmux.env' );
screen_files=( '.screenrc' );
bash_files=( '.bashrc' );


function install_files () {

    local dir=$1;
    shift;

    for x in `echo "$*"`;
    do
        if [ -f ${HOME}/${x} ];then
            mv ${HOME}/${x} ${HOME}/${x}.${execdatetime}.backup;
        fi
        ln -s ${cur_dir}/rc/${dir}/${x} $HOME/${x}
    done;
}

install_files zsh ${zsh_files[@]};
install_files tmux ${tmux_files[@]};
install_files screen ${screen_files[@]};
install_files bash ${bash_files[@]};

exit 0;

