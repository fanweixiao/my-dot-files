export JAVA_HOME=/Library/Java/Home
export JRE_HOME=/Library/Java/Home

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

BREW_BASH_COMPLETION="/usr/local/Library/Contributions/brew_bash_completion.sh"
test -f "$BREW_BASH_COMPLETION" && source "$BREW_BASH_COMPLETION"
