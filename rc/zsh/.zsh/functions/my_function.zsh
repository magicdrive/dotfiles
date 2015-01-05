backup() {
    local OPTION=''
    if [ $# -ne 0 ]; then
        local FILE=$1
        cp -a "${FILE}" "${FILE}.$(date +%Y-%m-%d_%H:%M:%S).bak"
    fi
}

mkcd() {
    if [ $# -ne 1 ]; then
        return
    fi
    mkdir -p "$@";
    cd "$@";
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
    term=$(echo $1 | perl -pe "s/(.)(.*)/[\1]\2/")
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


gen-gitkeep() {
    find $(pwd) -name .git -prune -or -type d -empty -print -exec touch {}/.keep \;
}

git-root() {
    cd "$(git rev-parse --show-toplevel)"
}
alias gtop="git-root"
alias gitroot="git-root"
alias gitr="git-root"
alias gir="git-root"


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


function history-all { history -E 1 }

