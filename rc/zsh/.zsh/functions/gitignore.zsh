# 
# gitignore.io cli
#

function compress_args() {
    hoge=$1; shift
    for x in "$@";do
        hoge=${hoge},${x};
    done;
    echo ${hoge}
}

function __gitignore_io() { 
    local arg;
    if [ $# -gt 1 ];then
        arg=`compress_args $@`;
    else
        arg=$1;
    fi

    curl http://gitignore.io/api/${arg};
}

alias gig=__gitignore_io

