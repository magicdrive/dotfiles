backup() {
    local OPTION=''
    if [ $# -ne 0 ]; then
        local FILE=$1
        cp -a ${FILE} ${FILE}.`date +%Y-%m-%d_%H:%M:%S`.bak
    fi
}

mkcd() {
    if [ $# -ne 1 ]; then
        return
    fi
    mkdir -p "$@";
    cd "$@";
}

maven() {
    if [ $# -gt 1  ]; then
        mvn archetype:create -DgroupId=$1 -DartifactId=$2
    fi
}

sbt-gen() {
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
    term=$(echo $1 | sed -E "s/(.)(.*)/[\1]\2/")
    ps -ef | grep ${term}
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

gen-gitkeep() {
   find . -type dir -name .git -prune -or -type dir -empty -print -exec touch {}/.gitignore \;
}

__tmux_attach() {
    if [ ${TMUX} ];then
        echo 'sessions should be nested with care, unset $TMUX to force';
        return 1;
    fi

    local tmux_name=${TMUX_DEFAULTNAME};
    [ $# -ne '0' ] && tmux_name=$1;
    session_exists=$(tmux ls 2>&1 | cut -d ':' -f 1 | grep -e "^${tmux_name}$" | wc -l | perl -pe "s/\s//g")
    if [ "${session_exists}" = 0 ]; then
        tmux new-session -s ${tmux_name};
    else
        tmux attach -t ${tmux_name}
    fi
}

alias gnu-smalltalk=$(which gst 2>/dev/null)
igst() { gnu-smalltalk; }
__git-status-crever() {
    if [ "$#" -eq '0' ];then
        git status
    elif [ "$#" -eq '1' ] && [ "$1" = 'repl' ];then
        gnu-smalltalk
    else
        gnu-smalltalk "$@"
    fi
}
alias gst=__git-status-crever


__parse_git_dirty() {
   [ "$(git status -s 2>/dev/null | wc -l | perl -pe "s/\s//g")" -eq "0" ] || echo "*"
}

__parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1)$(__parse_git_dirty)/"
}

mouse-toggle() {

    if [ "${TMUX_MOUSE}" = '' ] && export TMUX_MOUSE=off;

    if [ "${TMUX_MOUSE}" == 'on' ];then
        local switch=off
    else
        local switch=on
    fi

    tmux set-option -g mouse-select-pane ${switch}
    tmux set-option -g mode-mouse ${switch}
    tmux set-option -g mouse-resize-pane ${switch}
    tmux set-option -g mouse-select-pane ${switch}
    export TMUX_MOUSE=${switch}
}
alias mtoggle=mouse-toggle

function history-all { history -E 1 }

