#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Plan 9
alias t='SHELL=$PLAN9/bin/rc prompt="; " 9 9term &'
#alias a='SHELL=$PLAN9/bin/rc prompt="; " 9 acme -f /mnt/font/DejaVuSans/12a/font -F /mnt/font/DejaVuSansMono/12a/font &'

alias d='/home/ach/opt/drawterm/drawterm -h 104.238.188.92 -u glenda &'
font=/home/ach/opt/plan9port/font/pelm/unicode.9.font export font
PLAN9=/home/ach/opt/plan9port export PLAN9
PATH=$PATH:$PLAN9/bin export PATH

# Java grey windows
export _JAVA_AWT_WM_NONREPARENTING=1

# Scripts
PATH=$PATH:$HOME/rc export PATH

# Django colours
export DJANGO_COLORS="nocolor"

PS1='\W \$ '

export PATH=/home/ach/.local/bin:$PATH


# Mass Balance pyenv stuff
export PATH="/home/ach/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
