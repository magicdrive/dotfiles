#! /bin/bash

main() {


    install_dir="$HOME/opt/leiningen/"

    mkdir -p ${install_dir}/bin
    wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein -O ${install_dir}/bin/lein

    chmod 755 ${install_dir}/bin/lein
    ${install_dir}/bin/lein
}

main && exit 0;
