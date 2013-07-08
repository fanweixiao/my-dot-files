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
fi
alias lh='ls -a |egrep "^\."'
alias gvim='gvim -f'
alias tree='tree -a'
alias pbcopy='xclip -in -selection c'
alias pbpaste='xclip -out -selection c'
alias dstat='dstat --tcp -cglmnpry'
alias gfw='ssh -v -D 0.0.0.0:7070 only@hk.5bird.com -c arcfour128'
alias dixia='ssh -v fan412g@209.141.60.89 -p 443 -D 0.0.0.0:7070'
alias dixia1='echo "oromatio" && ssh vc892l@209.141.62.117 -p 443 -D 0.0.0.0:7070'
alias s='git status'

