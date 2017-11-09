#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


# stuff for gpg-agent

envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
        eval "$(cat "$envfile")"
else
        eval "$(gpg-agent --daemon --enable-ssh-support)"
fi
export GPG_AGENT_INFO  # the env file does not contain the export statement
export SSH_AUTH_SOCK   # enable gpg-agent for ssh
GPG_TTY=$(tty)
export GPG_TTY

