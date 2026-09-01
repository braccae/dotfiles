# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
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

