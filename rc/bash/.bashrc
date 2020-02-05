export PATH=/opt/current/bin/:/opt/current/sbin:$PATH
export PATH=/usr/local/bin/:/usr/local/sbin:$PATH

[ -e $HOME/.zshenv ] && source $HOME/.zshenv

[ -e ~/.zsh/completions/git-completion.bash ] && source ~/.zsh/completions/git-completion.bash
[ -e ~/git/z/z.sh ] && source ~/git/z/z.sh
z_home=$HOME/git/z
if [ -d ${z_home} ];then
    #_Z_NO_COMPLETE_CD=1
    _Z_CMD=j
    source  ${z_home}/z.sh
fi

stty stop undef
set completion-ignore-case on
shopt -s autocd

__parse_git_dirty() {
   [ "$(git status -s 2>/dev/null | wc -l | perl -pe "s/\s//g")" -eq "0" ] || echo "*"
}
__parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ {\1}$(__parse_git_dirty)/"
}
export PS1="\[\e[0;36m\][\u@\h \[\e[1;32m\]\W/\[\e[1;35m\]\$(__parse_git_branch)\[\e[0;36m\]] $\[\e[00m\] "


if [ $(uname) = 'Linux' ];then
    eval `dircolors`
else
    eval `gdircolors`
fi

if [ $(uname) = 'Darwin' ];then
    alias ls="ls -G"
    if [ -f /usr/local/bin/gls ];then
        alias ls="gls --color=auto"
    fi
else
    alias ls="ls --color=auto"
fi
alias la="ls -a"
alias lal="ls -la"
alias sl="ls"

alias vi="vim"
alias poweroff="sudo shutdown -h now"
alias eshl="manpath='';exec bash -l"
alias gst="git status"
alias t="__tmux_attach"

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[01;31m") \
        LESS_TERMCAP_md=$(printf "\e[01;38;5;74m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;46;32m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[04;35;4;146m") \
        man "$@"
}

psgrep() {
    term=$(echo $1 | perl -pe "s/(.)(.*)/[\1]\2/")
    ps -ef | grep ${term};
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

__tmux_attach() {
    if [ "${TMUX}" ];then
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


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
