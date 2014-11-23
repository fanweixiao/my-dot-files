export JAVA_HOME=/Library/Java/Home
export JRE_HOME=/Library/Java/Home

export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export GREP_OPTIONS='--color=auto'

BREW_BASH_COMPLETION="/usr/local/Library/Contributions/brew_bash_completion.sh"
test -f "$BREW_BASH_COMPLETION" && source "$BREW_BASH_COMPLETION"

source "`brew --prefix`/etc/grc.bashrc"
export LIBRARY_PATH+=":/usr/local/lib"
export CPATH+=":/usr/local/include"

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
export JAVA_HOME=$(/usr/libexec/java_home)
