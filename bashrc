#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\W \$ '

alias ls='ls -p --color=auto'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias f='mkdir /tmp/font && fontsrv -m /tmp/font &'
alias a='SHELL=$PLAN9/bin/rc acme -f /tmp/font/DejaVuSerif/10a/font -F /tmp/font/DejaVuSansMono/10a/font &'
alias b='SHELL=$PLAN9/bin/rc acme_black -f /tmp/font/DejaVuSerif/10a/font -F /tmp/font/DejaVuSansMono/10a/font &'
alias r='SHELL=$PLAN9/bin/rc acme_red -f /tmp/font/DejaVuSerif/10a/font -F /tmp/font/DejaVuSansMono/10a/font &'

PLAN9=/home/ach/opt/plan9port export PLAN9
PATH=$PATH:$PLAN9/bin export PATH

