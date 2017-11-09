#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias a='export SHELL=$PLAN9/bin/rc && 9 acme -f /usr/lib/plan9/font/lucsans/unicode.7.font -F /usr/lib/plan9/font/pelm/unicode.8.font'
alias ad='export SHELL=/usr/lib/plan9/bin/rc && 9 acme -f /home/alban/font/DejaVu\ Sans\ Condensed/12a/font -F /home/alban/font/DejaVu\ Sans\ Mono/10a/font &'
alias f='fontsrv -m ~/font/ &'

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

export EDITOR=vim
export VISUAL=vim

export font=/usr/lib/plan9/font/lucsans/typeunicode.9.font # sam

# Golang
export GOROOT=/home/alban/inf/go/go
export PATH=$PATH:$GOROOT/bin


source ~/.git-completion.bash

# Python : virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

# Impression DSI Telecom
export CUPS_USER=decrevoisier

#nice git CLI graph
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# iproute2
alias ip="ip --color"


