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


#Android 
export ANDROID_SDK_ROOT=/Applications/android-sdk-macosx
export ANDROID_HOME=/Applications/android-sdk-macosx
export ANDROID_NDK_HOME=/usr/local/opt/android-ndk


#tmux
export TMUXPLATFORM='mac'
export TMUX_DEFAULTNAME='ikegami'
export TMUXIP='lan'

#less color
export LESS='-R'

#java
if [ $(uname) = 'Darwin' ];then
    export JAVA_HOME="/Library/Java/Home"
else
    export JAVA_HOME="/usr/local/java/Home"
fi
export PATH="$JAVA_HOME/bin:$PATH:"

#perlbrew
#export PERLBREW_HOME=$HOME/.perlbrew/perl5
export PERLBREW_HOME=$HOME/perl5/perlbrew
if [ -d ${PERLBREW_HOME} ]; then
    export PATH="${PERLBREW_HOME}/bin:$PATH"
    source ${PERLBREW_HOME}/etc/bashrc
fi

# node.js
# nvm
if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
fi

#__END__

