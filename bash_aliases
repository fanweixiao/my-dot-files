# some more ls aliases
unamestr=`uname`
if [[ "$unamestr" == "Darwin" ]]; then
  alias ll='gls -aslhF --color'
  alias la='gls -A --color'
  alias l='gls -CF --color'
else
  alias ll='ls -aslhF --color'
  alias la='ls -A --color'
  alias l='ls -CF --color'
  alias pbcopy='xclip -in -selection c'
  alias pbpaste='xclip -out -selection c'
fi
alias lh='ls -a |egrep "^\."'
alias gvim='gvim -f'
alias tree='tree -a'
alias dstat='dstat --tcp -cglmnpry'
alias s='git status'
