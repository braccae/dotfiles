# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval `ssh-agent -s`
fi

. "$HOME/.cargo/env"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/var/home/andrew/.lmstudio/bin"
# End of LM Studio CLI section


. "$HOME/.local/share/../bin/env"
. "/var/home/andrew/.deno/env"
source /var/home/andrew/.local/share/bash-completion/completions/deno.bash
# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/pants/.lmstudio/bin"
# End of LM Studio CLI section

