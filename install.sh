#! /bin/bash

#
# install dotfiles
#

execdatetime=$(date +%Y-%m-%d-%H:%M:%S)
cur_dir=$(pwd)

## dotfiles list

zsh_files=( '.zsh' '.zshrc' '.zshenv' );
tmux_files=( '.tmux.conf' '.tmux.env' '.tmux-powerline.conf' );
screen_files=( '.screenrc' );
bash_files=( '.bashrc' );
vrapper_files=( '.vrapperrc' );
jshint_files=( '.jshintrc' );

backup_dir=$HOME/.dotfiles.backup
[ -d ${backup_dir} ] || mkdir -p ${backup_dir};

install_files () {
    local dir=$1;
    shift;

    for x in `echo "$*"`; do
        if [ -e ${HOME}/${x} ];then
            cp -af  ${HOME}/${x} ${backup_dir}/${x}.${execdatetime}.backup;
        fi
        ln -sf ${cur_dir}/rc/${dir}/${x} $HOME/${x}
    done;
}

install_files zsh ${zsh_files[@]};
install_files tmux ${tmux_files[@]};
install_files screen ${screen_files[@]};
install_files bash ${bash_files[@]};
install_files vrapper ${vrapper_files[@]};
install_files jshint ${jshint_files[@]};

./mklocaldir.sh

exit 0;

