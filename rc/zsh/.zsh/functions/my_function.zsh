function backup() {
    local OPTION=''
    if [ $# -ne 0 ]; then
        local FILE=$1
        cp -a ${FILE} ${FILE}.`date +%Y-%m-%d_%H:%M:%S`.bak
    fi
}

function mkcd() {
    if [ $# -ne 1 ]; then
        return
    fi
    mkdir -p $@;
    cd $@;
}

function maven() {
    if [ $# -gt 1  ]; then
        mvn archetype:create -DgroupId=$1 -DartifactId=$2
    fi
}

function sbt-gen() {
   mkdir -p src/{main,test}/{java,scala,resources}
   mkdir project
   touch project/Build.scala
   local projectname=$1
   cat << EOS  > build.sbt
name := "${projectname}"

version := "1.0"

scalaVersion := "2.9.2"
EOS

}

if [ $(uname) = 'Darwin' ];then
    function purge_swap() {
        sudo launchctl unload /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist;
        sudo launchctl load /System/Library/LaunchDaemons/com.apple.dynamic_pager.plist;
    }
fi

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[01;31m") \
        LESS_TERMCAP_md=$(printf "\e[01;38;5;74m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;46;32m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[04;35;4;146m") \
        man $@
}

psgrep() {
    ps -ef | grep $@
}


vimsub() {
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

rebind() {
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
    [ $TMUX ] && return
    local tmux_name=$TMUX_DEFAULTNAME;
    [ $# -ne '0' ] && tmux_name=$1;
    tmux attach -t $tmux_name || sleep 0 && tmux new-session -s $tmux_name; 
}

mouse-toggle() {
    if [ ${TMUX_MOUSE} == 'on' ];then
        tmux set-option -g mouse-select-pane off
        tmux set-option -g mode-mouse off
        tmux set-option -g mouse-resize-pane off
        tmux set-option -g mouse-select-pane off
        export TMUX_MOUSE=off
    else
        tmux set-option -g mouse-select-pane on
        tmux set-option -g mode-mouse on
        tmux set-option -g mouse-resize-pane on
        tmux set-option -g mouse-select-pane on
        export TMUX_MOUSE=on
    fi
}
alias mtoggle=mouse-toggle

# 全履歴の一覧を出力する
function history-all { 
    history -E 1 
}

