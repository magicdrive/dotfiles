### .zshrc ###
echo "Loading $(cd $HOME && pwd)/.zshrc"

zc() {
    local src
    for src in $@; do
        if [ -e "${src}" ];then
            ([[ ! -e "${src}.zwc" ]] || [ "${src:A}" -nt "${src}" ]) && zcompile "${src}"
        fi
    done
}
zc ~/.zshrc ~/.zprofile ~/.zlogin ~/.zlogout ~/.zshenv


###############################################
# key-binding                                 #
###############################################

# Vim like key binding
set -o vi

if [[ $- == *i* ]]; then
    # instert mode
    bindkey -M viins "^D" delete-char
    bindkey -M viins "^P" up-line-or-history
    bindkey -M viins "^N" down-line-or-history
    bindkey -M viins "^F" forward-char
    bindkey -M viins "^B" backward-char
    bindkey -M viins "^[" vi-cmd-mode
    bindkey -M viins "^A" beginning-of-line
    bindkey -M viins "^E" end-of-line
    bindkey -M viins "^H" backward-delete-char
    bindkey -M viins "^?" backward-delete-char
    bindkey -M viins "^W" backward-kill-word
    bindkey -M viins "^K" kill-line
    bindkey -M viins "^Y" yank
    # cmd mode
    bindkey -M vicmd "^W" backward-kill-line
    bindkey -M vicmd "^F" forward-char
    bindkey -M vicmd "^B" backward-char
fi
alias :q="exit"
alias :Q="exit"

source $HOME/.zsh/zsh_vim_visualmode.zsh

clear-screen-rehash() {
    zle clear-screen
    rehash
    zle reset-prompt
}
zle -N clear-screen-rehash
bindkey '^L' clear-screen-rehash

blank_to_git_status() {
    if [ -z "$BUFFER" ];then
        git rev-parse 2>/dev/null && echo && echo -e "\e[0;33m--- git status ---\e[0m" && git status -sb
        git rev-parse 2>/dev/null || zle accept-line
    fi
    zle reset-prompt
}
#zle -N blank_to_git_status
#bindkey '^G' blank_to_git_status

###############################################
# functions                                   #
###############################################

for x in `ls $HOME/.zsh/functions`;do
    source $HOME/.zsh/functions/${x}
done

###############################################
# completions                                 #
###############################################


#autoload -U compinit;compinit

# ディレクトリ名を入力するだけでカレントディレクトリを変更
setopt auto_cd

# タブキー連打で補完候補を順に表示
setopt auto_menu

# 自動修正機能(候補を表示)
#setopt correct

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt list_types

# パスの最後に付くスラッシュを自動的に削除しない
setopt noautoremoveslash

# = 以降でも補完できるようにする( --prefix=/usr 等の場合)
setopt magic_equal_subst

# 補完候補リストの日本語を正しく表示
setopt print_eight_bit

# 補完の時に大文字小文字を区別しない(但し、大文字を打った場合は小文字に変換しない)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# lsコマンドの補完候補にも色付き表示

if [[ -x "$(which dircolors)" ]];then
    eval $(dircolors)
elif [[ -x "$(which gdircolors)" ]];then
    eval $(gdircolors)
fi

zstyle ':completion:*:default' list-colors ${LS_COLORS}
# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

autoload -U compinit; compinit -u
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin \
    /usr/local/git/bin $HOME/bin

###############################################
# 履歴関係                                    #
###############################################
# ヒストリー機能
HISTFILE=~/.zsh_history      # ヒストリファイルを指定
HISTSIZE=10000               # ヒストリに保存するコマンド数
SAVEHIST=10000               # ヒストリファイルに保存するコマンド数
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
setopt hist_ignore_space    # 先頭がスペースの場合、ヒストリに追加しない

# cd - と入力してTabキーで今までに移動したディレクトリを一覧表示
setopt auto_pushd

# ディレクトリスタックに重複する物は古い方を削除
setopt pushd_ignore_dups

# コマンド履歴の検索機能の設定
# ^[  は「エスケープ」
# viなら    Ctrl-v ESC
# Emacsなら Ctrl-q ESC
# vimで編集する場合
# 上2行は Ctrl-v を押下した後、希望のキーを押下
# 下2行は「エスケープ」の後にキーの端末コードを入力
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
# 複数行コマンドの場合、上記の設定だと少々不都合
# tcshの様にする場合は以下のようにする
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end

# インクリメンタルサーチの設定
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward


###############################################
# プロンプト関係                              #
###############################################
# プロンプトに escape sequence (環境変数) を通す
setopt prompt_subst
autoload -U colors; colors

# compfunctions
#compdir=$HOME/.zsh/completions/
#for x in $(ls ${compdir});do source ${compdir}${x}; done;

# ^[  は「エスケープ」
#PROMPT="%B%{^[[36m%}%n@%m %c %#%{^[[m%}%b " # 通常のプロンプト
#PROMPT="[%n@%m %4~\$(__git_ps1 ] \$ "


export PROMPT_HOSTNAME="$HOST"

configure_prompt() {
    export PROMPT="%F{green}[%f%F{green}%n%f%F{green}@%f%F{green}${PROMPT_HOSTNAME}%f %F{yellow}%1~/%F{magenta}%B\$(__parse_git_branch)%f%b%F{green}]%f %B%#%b "
}

configure_prompt

# forやwhile/複数行入力時などに表示されるプロンプト
PROMPT2="%B%_>%b "

# 入力ミスを確認する場合に表示されるプロンプト
SPROMPT="%r is correct? [n,y,a,e]: "

# right prompt
vim_mode_status() {
    case $KEYMAP in
        vicmd)
            /bin/echo -n "[%{$fg_bold[red]%}NOR%{$reset_color%}] %{$fg_bold[white]%}%{$reset_color%}"
            ;;
        ""|main|viins)
            /bin/echo -n "[%{$fg_bold[cyan]%}INS%{$reset_color%}] %{$fg_bold[white]%}%{$reset_color%}"
            ;;
    esac
}

#if [ -d $HOME/git/zsh-vcs-prompt ];then
#    source $HOME/git/zsh-vcs-prompt/zshrc.sh
#    ZSH_VCS_PROMPT_ENABLE_CACHING='true'
#fi
#RPROMPT="$(vcs_super_info 2>/dev/null) $(vim_mode_status) $(date +%Y/%m/%d) %T "
RPROMPT="$(vim_mode_status) $(TZ="Asia/Tokyo" date "+%Y/%m/%d %H:%M:%S" )"
function zle-line-init zle-keymap-select {
#RPROMPT="$(vcs_super_info 2>/dev/null) $(vim_mode_status) $(date +%Y/%m/%d) %T "
RPROMPT="$(vim_mode_status) $(TZ="Asia/Tokyo" date "+%Y/%m/%d %H:%M:%S" )"
zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# 右プロンプトに入力がきたら消す
setopt transient_rprompt

# ターミナルのタイトル
case "${TERM}" in
    kterm*|xterm)
        precmd() {
            echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
        }
        ;;
esac

###############################################
# その他                                      #
###############################################
# ファイル作成時のパーミッション
umask 022

setopt no_beep               # ビープ音を消す
setopt nolistbeep           # 補完候補表示時などにビープ音を鳴らさない

setopt interactive_comments # コマンドラインで # 以降をコメントとする

setopt numeric_glob_sort     # 辞書順ではなく数値順でソート

setopt no_multios            # zshのリダイレクト機能を制限する

unsetopt promptcr            # 改行コードで終らない出力もちゃんと出力する
setopt ignore_eof           # Ctrl-dでログアウトしない

setopt no_hup                # ログアウト時にバックグラウンドジョブをkillしない
setopt no_checkjobs          # ログアウト時にバックグラウンドジョブを確認しない
setopt notify                # バックグラウンドジョブが終了したら(プロンプトの表示を待たずに)すぐに知らせる

#setopt rm_star_wait         # rm * を実行する前に確認
setopt rm_star_silent        # rm * を実行する前に確認しない
#setopt no_clobber           # リダイレクトで上書きを禁止
unsetopt no_clobber          # リダイレクトで上書きを許可

#setopt chase_links          # シンボリックリンクはリンク先のパスに変換してから実行
#setopt print_exit_value     # 戻り値が 0 以外の場合終了コードを表示
#setopt single_line_zle      # デフォルトの複数行コマンドライン編集ではなく、１行編集モードになる

# カーソル位置から前方削除(Ctrl-u)
#bindkey '^k' backward-kill-line

# / を単語の一部とみなさない記号の環境変数から削除
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

stty stop undef

###############################################
# completions                                 #
###############################################

### plugins

# my completions
fpath+=($HOME/.zsh/completions $fpath)

# zsh syntax
zsh_syntax=$HOME/git/zsh-syntax-highlighting;
if [ -d ${zsh_syntax} ];then
    source ${zsh_syntax}/zsh-syntax-highlighting.zsh
fi

# zsh completion
zsh_completions=$HOME/git/zsh-completions
if [ -d ${zsh_completions} ];then
    fpath+=(${zsh_completions}/src $fpath)
fi

# zsh autosuggestions
zsh_autosuggestions=$HOME/git/zsh-autosuggestions
if [ -d ${zsh_autosuggestions} ];then
    #ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
    source "$zsh_autosuggestions/zsh-autosuggestions.zsh"
fi

# ark completions
ark_dir="${HOME}/git/ark"
if [ -d "${ark_dir}" ];then
    source "${ark_dir}/misc/completions/ark-completion.sh"
fi

# kirke completions
kirke_dir="${HOME}/git/kirke"
if [ -d "${kirke_dir}" ];then
    source "${kirke_dir}/misc/completions/kirke-completion.sh"
fi

# goreg completions
goreg_dir="${HOME}/git/goreg"
if [ -d "${goreg_dir}" ];then
    source "${goreg_dir}/misc/completions/goreg-completion.sh"
fi

# enma completions
enma_dir="${HOME}/git/enma"
if [ -d "${enma_dir}" ];then
    source "${enma_dir}/misc/completions/enma-completion.sh"
fi

# t completions
t_dir="${HOME}/git/t"
if [ -d "${t_dir}" ];then
    source "${t_dir}/misc/completions/t-completion.sh"
fi

# nvm completion
nvm_completefile=~/.nvm/bash_completion
if [[ -f ${nvm_completefile} && -x "$(which node)" ]];then
    source ${nvm_completefile}
fi

npm_completefile=~/opt/etc/npm/bash_completion
if [[ -x "$(which npm)" && -x "$(which node)" ]];then
    if [[ ! -r "$(which ${npm_completefile})" ]];then
        mkdir -p $(dirname ${npm_completefile})
        npm completion > ${npm_completefile}
    fi
    source ${npm_completefile}
fi

if [[ -x "$(which direnv)" ]];then
    if [ -r ".envrc" ];then
        direnv allow
    fi
fi

if [ -e "${ASDF_HOME}" ];then
    source "${ASDF_HOME}/completions/asdf.bash"
fi

### fzf
fzf_path="$HOME/.fzf"
if [ -e "${fzf_path}" ];then
    if [[ -x "$(which rg)" ]];then
        export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
    fi
    if [[ -x "$(which bat)" ]];then
        export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'
    fi

    if [ $(uname) = 'Darwin' ];then
        if [ -f "$HOME/local/bin/ls" ];then
            export FZF_CTRL_O_OPTS="--preview 'ls --color=always -lha {}'"
            export FZF_CTRL_J_OPTS="--preview 'ls --color=always -lha {}'"
            alias fzpd="fzf --preview 'ls --color=always -lha {}'"
        elif [[ -x "$(which eza)" ]];then
            export FZF_CTRL_O_OPTS="--preview 'eza --color=always -lha {}'"
            export FZF_CTRL_J_OPTS="--preview 'eza --color=always -lha {}'"
            alias fzpd="fzf --preview 'eza --color=always -lha {}'"
        elif [ -f /usr/local/bin/gls ];then
            export FZF_CTRL_O_OPTS="--preview 'gls --color=always -lha {}'"
            export FZF_CTRL_J_OPTS="--preview 'gls --color=always -lha {}'"
            alias fzpd="fzf --preview 'gls --color=always -lha {}'"
        else
            export FZF_CTRL_O_OPTS="--preview 'ls -G -lha {}'"
            export FZF_CTRL_J_OPTS="--preview 'ls -G -lha {}'"
            alias fzpd="fzf --preview 'ls -G -lha {}'"
        fi
    else
        if [[ -x $(which eza) ]];then
            export FZF_CTRL_O_OPTS="--preview 'eza --color=always -lha {}'"
            export FZF_CTRL_J_OPTS="--preview 'eza --color=always -lha {}'"
            alias fzpd="fzf --preview 'eza --color=always -lha {}'"
        else
            export FZF_CTRL_O_OPTS="--preview 'ls --color=always -lha {}'"
            export FZF_CTRL_J_OPTS="--preview 'ls --color=always -lha {}'"
            alias fzpd="fzf --preview 'ls --color=always -lha {}'"
        fi
    fi


    export FZF_DEFAULT_OPTS='--height 80% --reverse --border'
    export FORGIT_LOG_FZF_OPTS="${FZF_DEFAULT_OPTS}"
    #source ${fzf_path}

    alias fzp="fzf --preview 'bat --color=always --style=header,grid --line-range :100 {}'"


    # Key bindings
    # ------------
    if [[ $- == *i* ]]; then
        __fzf_use_tmux__() {
          [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ]
        }

        __fzfcmd() {
          __fzf_use_tmux__ &&
            echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
        }

        # Ensure precmds are run after cd
        fzf-redraw-prompt() {
          local precmd
          for precmd in $precmd_functions; do
            $precmd
          done
          zle reset-prompt
        }
        zle -N fzf-redraw-prompt


        # CTRL-R - Paste the selected command from history into the command line
        fzf-history-widget() {
          local selected num
          setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
          selected=( $(fc -rl 1 |
            FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd)) )
          local ret=$?
          if [ -n "$selected" ]; then
            num=$selected[1]
            if [ -n "$num" ]; then
              zle vi-fetch-history -n $num
            fi
          fi
          zle reset-prompt
          return $ret
        }
        zle     -N   fzf-history-widget
        bindkey '^R' fzf-history-widget

    fi

fi

# z
z_home="$HOME/git/z"
if [ -d ${z_home} ];then
    _Z_CMD=j
    source ${z_home}/z.sh
fi

if [ -d ${z_home} -a -f $HOME/.fzf.zsh ];then
    z_list() {
        _z -l 2>&1 | perl -pe 's/^(?:common:|[\.0-9]*)\s*//g'
    }

    z_list_fzf() {
        z_list | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_J_OPTS" $(__fzfcmd) --query="$1"
    }

    fj() {
        setopt localoptions pipefail no_aliases 2> /dev/null
        local dir="$(z_list_fzf "$1")"
        if [ -d "$dir" ]; then
            cd "$dir"
        fi
        unset dir # ensure this doesn't end up appearing in prompt expansion
    }


    fzf-jump-widget() {
        setopt localoptions pipefail no_aliases 2> /dev/null
        local dir="$(z_list_fzf "$LBUFFER")"
        if [[ -z "$dir" ]]; then
          zle redisplay
          return 0
        fi
        cd "$dir"
        unset dir # ensure this doesn't end up appearing in prompt expansion
        unset LBUFFER
        local ret=$?
        zle fzf-redraw-prompt
        zle reset-prompt
        return $ret
    }
    zle     -N   fzf-jump-widget
    bindkey '^O' fzf-jump-widget

fi

autoload -U compinit
compinit -u
###############################################
# aliases                                     #
###############################################

setopt complete_aliases


alias d="cd"

if [ $(uname) = 'Darwin' ];then
    if [ -f "$HOME/local/bin/ls" ];then
        lscmd="ls --color=auto"
    elif [ -f /usr/local/bin/gls ];then
        lscmd="gls --color=auto"
    else
        lscmd="ls -G"
    fi
else
    lscmd="ls --color=auto"
fi

alias ls="$lscmd"

modernize() {
    if [[ -x "$(which bat)" ]];then
        alias __cat="cat";
        alias cat="bat";
    fi
    if [[ -x  "$(which eza)" ]];then
	    unalias ls 2>&1 > /dev/null
	    alias __ls="${lscmd}"
        alias ls="eza --color=auto"
    fi
}

modernize;

ancientize() {
    if [[ -x "$(which bat)" ]];then
        unalias __cat 2>&1 > /dev/null
        unalias cat 2>&1 > /dev/null
    fi

    if [[ -x "$(which eza)" ]];then
	    unalias __ls 2>&1 > /dev/null
	    alias ls="$lscmd"
    fi
}


if [[ -x "$(which bat)" ]];then
    alias cat=bat
    alias _cat=/bin/cat
fi

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"

alias h='history -E -32'

pathdump() { echo $PATH | perl -pe "s/::/:/g" | perl -pe 's/:/\n/g'; }


# ack with pager
alias acl="ack --pager='less -R'"
alias zload="source $HOME/.zshrc"


### Emacs ###
### carbon emacs ###
if [ -d /Applications/CarbonEmacs.app ];then
    alias carbon_emacs='/Applications/CarbonEmacs.app/Contents/MacOS/Emacs -nw'
fi

### cocoa emacs ###
if [ -d /Applications/CocoaEmacs.app ];then
    alias cocoa_emacs='/Applications/CocoaEmacs.app/Contents/MacOS/Emacs -nw'
fi

### Vim ###
### macvim ###
if [ -d /Applications/MacVim.app ];then
    alias macvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias mvim="env LANG=ja_JP.UTF-8 open -a MacVim"
fi


vim_simple='vim -u ~/git/dotfiles/rc/vi/virc.vim'
alias vim-simple="${vim_simple}"
alias sudovi="sudo ${vim_simple}"
alias sudo-vim="sudo ${vim_simple}"
alias svi="sudo ${vim_simple}"
alias vimpager="$HOME/.vim/bundle/vimpager/vimpager"
alias vim_origin='/bin/vim'
alias vi="${vim_simple}"
alias e="${EDITOR}"
compdef vi=vim
compdef e=vim

### diff and patch
[[ -x "$(which colordiff )" ]] && alias diff="$(which colordiff)"

if [ "$(uname -s)" = 'Darwin' ];then
    [[ -x "$(which gpatch )" ]] && alias patch="gpatch"
fi

### gradle
export GRADLE_OPT="--daemon"
alias gradle="gradle $GRADLE_OPT"
alias gradlew="./gradlew $GRADLE_OPT"
alias gw="gradlew"
compdef gradlew=gradle
compdef gw=gradle

### tmux
alias tmux='tmux -2'
alias tn='tmux new-session -s'
alias ta='tmux attach -t'
alias t-win='tmux list-window'
alias tl='tmux list-sessions'
alias tmkill='tmux kill-server'
alias tmkillsession='tmux kill-session -t'
alias th='t head'

### screen
alias sc="screen"

### ls
alias cd..='cd ..'
alias sl='ls'
alias la='ls -a'
alias l='ls -F --time-style=long-iso --color=auto'
alias ll='ls -lh'
alias lal='ls -lha'
alias clr='clear'

# perl
alias cpam="cpanm"
alias perlfunc="perldoc -f"

### Git
alias glone="git clone"
alias g='git'
alias ginfo='git info'
alias lsg='git status'
compdef g=git
compdef tig=git

### ruby-bundler
alias bundle-private="bundle install --path=./vendor/bundle --binstubs=./.bundle/binstubs"

if [[ -x "$(which brew)" ]];then
    brew-package-upgrade() {for x in $(echo update upgrade cleanup);do echo "-----${x}-----" && brew $x ;done;}
fi

webrickup() { ruby -r webrick -e "WEBrick::HTTPServer.new({ :DocumentRoot => '$(pwd)/', :Port => 8000}).start" }

### python
alias ipy="ipython2"
alias ipy3="ipython3"
alias ipy2="ipython2"

### clisp -o scheme
if [[ -x "$(which gosh)" ]] && [[ -x "$(which rlwrap)" ]];then
    alias gosh="rlwrap -pCyan gosh"
fi

### docker
if [[ -x "$(which docker)" ]];then
    docker-service-list() {
        sudo docker inspect -f '{{.Name}} {{.HostConfig.RestartPolicy.Name}}' $(docker ps -aq) | grep always
    }

    alias docker="sudo docker"
    alias dk="docker"
fi
if [[ -x "$(which docker-repl)" ]];then
    alias dkl="docker-repl"
fi

### shells
take-over-sudo(){ sudo PATH="$PATH" "$@" }
alias tsudo=take-over-sudo
alias eshl="manpath='';exec zsh -l"

### fzf
if [[ -x $(which fzf) ]];then
    alias f="fzf"
fi

### browser-mac
if [ "$(uname -s)" = 'Darwin' ];then
    alias chrome="open -a Google\ Chrome"
    alias firefox="open -a Firefox"
fi

if [ "$(uname -s)" = 'Darwin' ];then
    dcdw() {
      cd $(find ~/vagrant/ -name Vagrantfile | perl -pe "s/Vagrantfile$//" | sort| fzf);
    }
    dcd() {
      dcdw
      if [ -f "./Vagrantfile" ];then
          vagrant up
          vagrant ssh
      fi
    }
fi


if [ "$(uname -s)" = 'Darwin' ];then
    if [[ -x "$(which reattach-to-user-namespace)" ]];then
        alias npbcopy="reattach-to-user-namespace pbcopy"
        alias npbpaste="reattach-to-user-namespace pbpaste"
    fi
fi

for x in $(echo supervisorctl supervisord);do
    [ -f "/usr/local/bin/${x}" ] && alias ${x}="sudo /usr/local/bin/${x}"
done

# fzf
if [[ -f "$HOME/.fzf.zsh" ]];then
    if [[ "$(basename $SHELL)" = 'zsh' ]];then
        source "$HOME/.fzf.zsh"
    else
        source "$HOME/.fzf.bash"
    fi
fi



### if debian-based
if [[ -f /etc/debian_version ]];then
    alias aptitude="sudo aptitude"
    alias apt-get="sudo apt-get"
    alias apt="sudo apt"
fi
### if fedora-based
if [[ -f /etc/redhat-release ]] && [[ -x "$(which yum)" ]];then
    alias yum="sudo yum"
fi

### reconfigure path
export PATH="${ORIGPATH}:${PATH}"
typeset -U PATH

# read local setting
[ -f "$HOME/.zshrc.local" ] && source $HOME/.zshrc.local

# __END__
