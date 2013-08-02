# 
# switcher for pythonz with virtualenv
#
#
usage=<<EOS
Usage:
    pythonv [python_edithon]
EOS

function __pythonz_virtualenv_switch() {
    if [ $# -lt 1 ];then
        echo ${usage}
        return 1;
    fi

    if [ $1 = "list" ];then
        pythonz list
        return 0;
    fi

    local python_edition=$1
    target=${PYTHONZ_HOME}/ENV/${python_edition}/bin/activate

    if [ ! -e ${target} ] ;then
        echo "${python_edition} is not in virtualenvs.\n"
        pythonz list
        return 1;
    fi

    source ${target}
}

alias pythonv="__pythonz_virtualenv_switch"
