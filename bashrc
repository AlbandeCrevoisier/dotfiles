#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\u \W \$ '
[[ $TERM == tmux* ]] && PS1='\W \$ '

alias ls='ls -F'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Prevent using bold
export LESS="-R -Ddy"

export font="/mnt/font/SourceCodePro-Light/12a/font"
export prompt="; "

export _JAVA_AWT_WM_NONREPARENTING=1

export PATH=$HOME/bin:$HOME/.local/bin:$PATH

export VISUAL=sam
export EDITOR=sam

source $HOME/opt/chibi-scheme/contrib/bash_completion
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
