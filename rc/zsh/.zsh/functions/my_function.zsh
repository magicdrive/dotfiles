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

restore_zhistory() {
    mv "$HOME/.zsh_history" "$HOME/.zhistory_bad"
    strings "$HOME/.zhistory_bad" > "$HOME/.zhistory"
    fc -R "$HOME/.zhistory"
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
        vim -c "argdo %s/${before}/${after}/gce | update" "$@"
    fi
}


gen-gitkeep() {
    find $(pwd) -name .git -prune -or -type d -empty -print -exec touch {}/.keep \;
}

git-root() {
    cd "$(git rev-parse --show-toplevel)"
}
alias gcd="git-root"


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
    git rev-parse 2> /dev/null && [ "$(git status --short 2>/dev/null)" = "" ] || echo "*"
}

__parse_git_branch() {
    git rev-parse 2> /dev/null && echo " ($(git rev-parse --abbrev-ref HEAD 2> /dev/null)$(__parse_git_dirty))"
}

git-branch-name() {
    git rev-parse 2> /dev/null && echo "$(git rev-parse --abbrev-ref HEAD 2> /dev/null)$(__parse_git_dirty)"
}


function history-all { history -E 1 }

