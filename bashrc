export HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s progcomp
export HISTSIZE=3000
export HISTFILESIZE=2000
export HISTIGNORE="&:ls:cd ~:cd ..:history:[ ]*"
# export PROMPT_COMMAND="history -a"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# ====== customized PS1 with git by C.C.
parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
D=$"\[\033[0m\]"
BLUE=$"\[\033[34m\]"
YELLOW=$"\[\033[33m\]"
RED=$"\[\e[31m\]"
PINK=$"\[\e[35m\]"
GREEN=$"\[\e[32m\]"
ORANGE=$"\[\e[36m\]"
export PS1="\n${ORANGE}\u${D}${RED}@${D}${PINK}\h${D}:${GREEN}\w${D}${ORANGE}\$(parse_git_branch)${D}\v${PINK}*\j${D}${RED}\$${D}"
# ==================

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

if [ -f ~/_config/gitcompletion.bash ]; then
  source ~/_config/gitcompletion.bash
fi

if [ -f ~/_config/bash_aliases ]; then
  . ~/_config/bash_aliases
fi

# tmux completion
if [ -f ~/_config/bash_completion_tmux.sh ]; then
  source ~/_config/bash_completion_tmux.sh
fi

# /opt path
if [ -d /opt/bin ]; then
  PATH=$PATH:/opt/bin
fi

if [[ "$unamestr" != "Darwin" ]]; then
  echo 'loading dircolor'
  # curl https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark > ~/.dircolors
  if [ -x /usr/bin/dircolors ]; then
    test -r ~/_config/dircolors && eval "$(dircolors -b ~/_config/dircolors)" || eval "$(dircolors -b)"
  fi
fi

# add /usr/local/sbin
if [ -d /usr/local/sbin ]; then
  PATH=/usr/local/sbin:$PATH
fi

# RVM
if [ -d $HOME/.rvm/bin ]; then
  PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
