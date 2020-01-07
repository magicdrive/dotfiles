###
### env define
###

if [ "$(uname -s)" != 'Darwin' ];then
    setopt no_global_rcs
fi

export PATH="$HOME/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/local/ssl/bin:$PATH:"
export MANPATH="$HOME/local/share/man:$HOME/share/man:$(
find /usr/local -path "/usr/local/rbenv" -prune -regex '^[a-zA-Z0-9_-/\.]*man$' -type d 2>/dev/null | perl -pe 's/[\r\n]/:/'
):$MANPATH"

# nginx
[ -e "/usr/local/nginx" ] && export PATH=/usr/local/nginx/sbin:$PATH
# mysql
if [ -d "/usr/local/mysql" ];then
    export PATH=/usr/local/mysql/bin:$PATH
    if [ "$(uname -s)" = "Darwin" ];then
        export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:${DYLD_LIBRARY_PATH}
        alias mysql.server="sudo mysql.server"
    fi
fi
# opencv
if [ -e "$HOME/opt/opencv" ];then
    export PATH=$HOME/opt/opencv/bin:$PATH
    if [ "$(uname -s)" = "Darwin" ];then
        export DYLD_LIBRARY_PATH=$HOME/opt/opencv/lib:${DYLD_LIBRARY_PATH}
    fi
fi

## xcode includepath
#if [ "$(uname -s)" = "Darwin" ];then
#    export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
#fi

### laguage
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# EDITOR
export EDITOR=vim

#PAGER
export PAGER='less'
export LESS='-R'

# Android
if [ "$(uname -s)" = 'Darwin' ];then
    export ANDROID_SDK_ROOT=/Applications/android-sdk-macosx
    export ANDROID_HOME=/Applications/android-sdk-macosx
    export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
fi

if [ "$(uname -s)" = 'Darwin' ];then
    if [ -d "/Applications/VMware Fusion.app" ];then
        export VMWARE_FUSION_ROOT="/Applications/VMware Fusion.app"
        export PATH="${VMWARE_FUSION_ROOT}/Contents/Library:${PATH}"
    fi
fi

# tmux
if [ "$(uname -s)" = 'Darwin' ];then
    export TMUXPLATFORM='mac'
else
    export TMUXPLATFORM='linux'
fi
export TMUX_DEFAULTNAME='main'

### java
if [ "$(uname -s)" = 'Darwin' ];then
    export JAVA_HOME="/Library/Java/Home"
else
    export JAVA_HOME="/usr/java/default"
fi
if [ -e "${JAVA_HOME}" ];then
    export PATH="$JAVA_HOME/bin:$PATH:"
    export MANPATH="${JAVA_HOME}/man:$MANPATH"
fi

### scala
export SCALA_HOME="/opt/scala/default"
if [ -e "${SCALA_HOME}" ];then
    export PATH="${SCALA_HOME}/bin:${PATH}:"
    export MANPATH="${SCALA_HOME}/man:$MANPATH"
fi
# sbt
export SBT_HOME="/opt/sbt/default"
if [ -e "${SBT_HOME}" ];then
    export PATH="${SBT_HOME}/bin:${PATH}:"
fi

### clojure
export CLOJURE_HOME="/opt/clojure"
if [ -e "${CLOJURE_HOME}" ];then
    export PATH="${CLOJURE_HOME}/bin:${PATH}:"
fi

### groovy
export GROOVY_HOME="/opt/groovy"
if [ -e "${GROOVY_HOME}" ];then
    export PATH="${GROOVY_HOME}/bin:${PATH}:"
    export MANPATH="${GROOVY_HOME}/man:$MANPATH"
fi
### gradle
export GRADLE_HOME="/opt/gradle"
if [ -e "${GRADLE_HOME}" ];then
    export PATH="${GRADLE_HOME}/bin:${PATH}:"
    export MANPATH="${GRADLE_HOME}/man:$MANPATH"
fi

### golang
if [ -e "$HOME/opt/go" ];then
    export GOROOT="$HOME/opt/go"
elif [ -e "/opt/go" ];then
    export GOROOT="/opt/go"
fi

if [ -e "${GOROOT}" ];then
    export GOPATH="${HOME}/.gopath:${HOME}/projects/gocode"
    export PATH="${GOROOT}/bin:${HOME}/.gopath/bin:${HOME}/projects/gocode/bin:${PATH}"
fi

if [[ -x "$(which direnv)" ]];then
    eval "$(direnv hook zsh)"
fi

### perl
# plenv
export PLENV_ROOT="$HOME/.plenv"
if [ -e "${PLENV_ROOT}" ];then
    export PATH="$PLENV_ROOT/shims:$PLENV_ROOT/bin:$PATH"
    eval "$(plenv init - zsh)"
fi

### python
#pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -e "${PYENV_ROOT}" ]; then
    export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

### ruby
#rbenv
if [ -e /usr/local/rbenv ];then
    export RBENV_ROOT=/usr/local/rbenv
elif [ -e $HOME/.rbenv ];then
    export RBENV_ROOT=$HOME/.rbenv
fi
if [ -e "${RBENV_ROOT}" ];then
    export PATH="$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH"
    if [ "$(basename $SHELL)" = 'zsh' ];then
        eval "$(rbenv init - zsh)"
    else
        eval "$(rbenv init - )"
    fi
fi
#mruby
if [ -e $HOME/local/mruby ];then
    export MRUBY_ROOT=$HOME/git/mruby/Home
    export PATH="$MRUBY_ROOT/bin:$PATH"
elif [ -e /usr/local/mruby/HOME ];then
    export MRUBY_ROOT=/usr/local/mruby/HOME
    export PATH="$MRUBY_ROOT/bin:$PATH"
fi

# node.js
# nvm
export NVM_DIR="$HOME/.nvm"
if [ -e "$NVM_DIR/nvm.sh" ];then
    source "$NVM_DIR/nvm.sh"
fi

### llvm
export LLVM_HOME="/usr/local/llvm"
if [ -e ${LLVM_HOME} ];then
    export PATH="${LLVM_HOME}/bin:$PATH"
    export MANPATH="${LLVM_HOME}/share/man:$MANPATH"
fi

# erlang
export ERLANG_HOME="/opt/beamvm/erlang"
if [ -e ${ERLANG_HOME} ];then
    export PATH="${ERLANG_HOME}/bin:$PATH"
    export MANPATH="${ERLANG_HOME}/man:$MANPATH"
fi

# elixir
export ELIXIR_HOME="/opt/beamvm/elixir"
if [ -e ${ELIXIR_HOME} ];then
    export PATH="${ELIXIR_HOME}/bin:$PATH"
    alias rebar="${ELIXIR_HOME}rebar"
fi

# leiningen
export LEININGEN_HOME="$HOME/opt/leiningen"
if [ -e ${LEININGEN_HOME} ];then
    export PATH="${LEININGEN_HOME}/bin:$PATH"
fi

# clojure
export CLOJURE_HOME="/opt/clojure"
if [ -e ${CLOJURE_HOME} ];then
    export PATH="${CLOJURE_HOME}/bin:$PATH"
fi

# haxe
export HAXE_HOME="$HOME/opt/haxe"
if [ -e "${HAXE_HOME}" ];then
    export PATH="${HAXE_HOME}/build:$PATH"
    export HAXE_STD_PATH="${HAXE_HOME}/build/std:"
fi

# dlang
export DLANG_HOME="$HOME/opt/dmd2"
if [ -e "${DLANG_HOME}" ];then
    export PATH="${DLANG_HOME}/bin:$PATH"
fi

# rust
export CARGO_HOME="$HOME/.cargo"
if [ -e "${CARGO_HOME}" ];then
    source $HOME/.cargo/env
    export PATH="${CARGO_HOME}/bin:$PATH"
fi

#__END__
