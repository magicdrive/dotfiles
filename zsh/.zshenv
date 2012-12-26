###
### env define
###
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
#export LANG='ja_JP.UTF-8'
export LANG='en_US.UTF-8'
# editor
export EDITOR=vim
#less color
export LESS='-R'
#PAGER
export PAGER='less'
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH:"

#tmux
export TMUXPLATFORM='mac'
export TMUX_DEFAULTNAME='ikegami'
export TMUXIP='lan'

#less color
export LESS='-R'

#java
export JAVA_HOME="/Library/Java/Home"
export PATH="$JAVA_HOME/bin:$PATH:"

#perlbrew
if [ -d $HOME/perl5/perlbrew ]; then
    source $HOME/perl5/perlbrew/etc/bashrc
    alias perlbrew="$HOME/perl5/perlbrew/bin/perlbrew"
fi

# node.js
export PATH="$PATH:$HOME/.nave/installed/$NODEVERSION/bin:"
export PATH="$PATH/usr/local/share/npm/bin/jshint:"
# nvm と指定されたバージョンの Node.js がインストール済みの場合だけ
# # 設定を有効にする
if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh

    if which nvm >/dev/null 2>&1 ;then
        _nodejs_use_version="v0.8.11"
        if nvm ls | grep -F -e "${_nodejs_use_version}" >/dev/null 2>&1 ;then
            nvm use "${_nodejs_use_version}" >/dev/null
            export NODE_PATH=${NVM_PATH}_modules${NODE_PATH:+:}${NODE_PATH}
        fi
        unset _nodejs_use_version
    fi
fi

#__END__

