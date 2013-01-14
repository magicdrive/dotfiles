function backup() {
    local OPTION=''
    if [ $# -ne 0 ]; then
        [ -d "$1" ] && OPTION="-a"
        local FILE=$1
        cp $OPTION $FILE $FILE.`date +%Y-%m-%d_%H:%M:%S`.bak
    fi
}

function maven() {
    if [ $# -gt 1  ]; then
        mvn archetype:create -DgroupId=$1 -DartifactId=$2
    fi
}

function man() {
    env \
        LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man $@
}


function vimsub {
    if [ $# -lt 3 ] || [ $1 = '-h' ] ; then
        cat << 'EOS'
        interactive character replacement using vim.
        Usage:
            vimsub [BEFOR] [AFTER] [FILE]
EOS
    else
        local before=$1
        local after=$2
        shift 2
        vim -c "argdo %s/${before}/${after}/gce | update" $@
    fi
}

function rebind() {
    local ___key=$1
    if [ "$___key" = 't' ];then
        tmux set-option -g prefix C-t && tmux bind-key C-t send-prefix
    tmux unbind-key C-q && tmux unbind-key C-z
    elif [ "$___key" = 'z' ];then
        tmux set-option -g prefix C-z && tmux bind-key C-z send-prefix
    tmux unbind-key C-q && tmux unbind-key C-t
    elif [ "$___key" = 'q' ];then
        tmux set-option -g prefix C-q && tmux bind-key C-q send-prefix
    tmux unbind-key C-z && tmux unbind-key C-t
    else
        cat << 'EOS'
        rebind tmux prefix key
        Usage:
            rebind [z|t|q]
EOS
    return;
    fi
    tmux unbind-key C-b
}

function __tmux_attach() {
    local tmux_name=$TMUX_DEFAULTNAME;
    if [ $# -ne '0' ];then
        tmux_name=$1;
    fi

    [ ${tmux_name} = '' ] && tmux_name=0

    tmux attach -t $tmux_name > /dev/null 2>&1 || tmux new-session -s $tmux_name; 
}


# 全履歴の一覧を出力する
function history-all { 
    history -E 1 
}

function module-starter() {
  if [ $# -ne 0 ]; then
    module-starter --author="Hiroshi IKEGAMI" --email=magicdriv@cpan.org --module=$1
  else 
    module-starter
  fi
}

