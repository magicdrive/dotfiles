###
### env define
###

export PATH="$HOME/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH:"
export MANPATH="$HOME/local/share/man:$HOME/share/man:$(
find /usr/local -path "/usr/local/rbenv" -prune -regex '^[a-zA-Z0-9_-/\.]*man$' -type d 2>/dev/null | perl -pe 's/[\r\n]/:/'
):$MANPATH"

# nginx
[ -e /usr/local/nginx ] && export PATH=/usr/local/nginx/sbin:$PATH
# mysql
if [ -e /usr/local/mysql ];then
  export PATH=/usr/local/mysql/bin:$PATH
  if [ "$(uname -s)" = "Darwin" ];then
    export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:${DYLD_LIBRARY_PATH}
  fi
fi
# opencv
if [ -e /usr/local/opencv ];then
  export PATH=/usr/local/opencv/bin:$PATH
  if [ "$(uname -s)" = "Darwin" ];then
    export DYLD_LIBRARY_PATH=/usr/local/opencv/lib:${DYLD_LIBRARY_PATH}
  fi
fi

### laguage
export LANG='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# EDITOR
export EDITOR=vim

#PAGER
export PAGER='less'
export LESS='-R'
if [ $(uname -s) = 'Darwin' ];then
  lesspipe_sh=/usr/local/bin/src-hilite-lesspipe.sh
else
  lesspipe_sh=/usr/share/source-highlight/src-hilite-lesspipe.sh
fi
alias less_color="LESSOPEN=\"| ${lesspipe_sh} %s\" less"


# Android
if [ $(uname -s) = 'Darwin' ];then
  export ANDROID_SDK_ROOT=/Applications/android-sdk-macosx
  export ANDROID_HOME=/Applications/android-sdk-macosx
  export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
fi

if [ "$(uname -s)" = 'Darwin' ];then
  if [ -d "/Applications/VMware\ Fusion.app" ];then
    export VMWARE_FUSION_ROOT="/Applications/VMware\ Fusion.app"
    export PATH="${VMWARE_FUSION_ROOT}/Contents/Library/:${PATH}"
  fi
fi

# tmux
if [ $(uname -s) = 'Darwin' ];then
  export TMUXPLATFORM='mac'
else
  export TMUXPLATFORM='linux'
fi
export TMUX_DEFAULTNAME='main'

### java
if [ $(uname -s) = 'Darwin' ];then
  export JAVA_HOME="/Library/Java/Home"
else
  export JAVA_HOME="/usr/local/java/Home"
fi
export PATH="$JAVA_HOME/bin:$PATH:"
export MANPATH="${JAVA_HOME}/man:$MANPATH"

### scala
if [ -d /usr/local/jvm/scala ];then
  export SCALA_HOME="/usr/local/jvm/scala/Home"
  export PATH="${SCALA_HOME}/bin:${PATH}:"
  export MANPATH="${SCALA_HOME}/man:$MANPATH"
fi

### groovy
if [ -d /usr/local/groovy ];then
  export GROOVY_HOME="/usr/local/groovy/Home"
  export PATH="${GROOVY_HOME}/bin:${PATH}:"
  export MANPATH="${GROOVY_HOME}/man:$MANPATH"
fi

### golang
if [ -d /usr/local/go ];then
  export GOROOT="/usr/local/go"
  export GOPATH="${HOME}/.gopath"
  export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"
fi
# direnv
if [ -f "$(which direnv)" ];then
  eval "$(direnv hook zsh)"
fi


### perl
# plenv
export PLENV_ROOT="$HOME/.plenv"
if [ -d "${PLENV_ROOT}" ];then
  export PATH="$PLENV_ROOT/shims:$PLENV_ROOT/bin:$PATH"
  eval "$(plenv init - zsh)"
fi

### python
#pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

### ruby
#rbenv
if [ -d /usr/local/rbenv ];then
  export RBENV_ROOT=/usr/local/rbenv
elif [ -d $HOME/.rbenv ];then
  export RBENV_ROOT=$HOME/.rbenv
fi
if [ -d "${RBENV_ROOT}" ];then
  export PATH="$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init - zsh)"
fi
#mruby
if [ -d $HOME/local/mruby ];then
  export MRUBY_ROOT=$HOME/git/mruby/Home
  export PATH="$MRUBY_ROOT/bin:$PATH"
elif [ -d /usr/local/mruby/HOME ];then
  export MRUBY_ROOT=/usr/local/mruby/HOME
  export PATH="$MRUBY_ROOT/bin:$PATH"
fi

# node.js
# nvm
if [ -f ~/.nvm/nvm.sh ];then
  source ~/.nvm/nvm.sh
fi

### llvm
export LLVM_HOME=/usr/local/llvm
if [ -e ${LLVM_HOME} ];then
  export PATH="${LLVM_HOME}/bin:$PATH"
  export MANPATH="${LLVM_HOME}/share/man:$MANPATH"
fi

# erlang
export ERLANG_HOME=/usr/local/beamvm/erlang
if [ -e ${ERLANG_HOME} ];then
  export PATH="${ERLANG_HOME}/bin:$PATH"
  export MANPATH="${ERLANG_HOME}/man:$MANPATH"
fi

# elixir
export ELIXIR_HOME=/usr/local/beamvm/elixir
if [ -e ${ELIXIR_HOME} ];then
  export PATH="${ELIXIR_HOME}/bin:$PATH"
  alias rebar="${ELIXIR_HOME}rebar"
fi

# haxe
export HAXE_HOME=/usr/local/haxe/HOME
if [ -e "${HAXE_HOME}" ];then
  export PATH="${HAXE_HOME}/build:$PATH"
  export HAXE_STD_PATH="${HAXE_HOME}/build/std:"
fi

# dlang
export DLANG_HOME=/usr/local/dmd2
if [ -e "${DLANG_HOME}" ];then
  export PATH="${DLANG_HOME}/bin:$PATH"
fi

#__END__
