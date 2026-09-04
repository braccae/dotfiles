# --- Theming ---
# Catppuccin Latte Theme (for zsh-syntax-highlighting)
#
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#acb0be'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[function]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[command]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#40a02b,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#fe640b,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#fe640b'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#fe640b'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#8839ef'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#40a02b'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#40a02b'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#d20f39'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#d20f39'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#df8e1d'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#df8e1d'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#4c4f69'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[path]='fg=#4c4f69,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#d20f39,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#4c4f69,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#d20f39,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#8839ef'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#e64553'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[default]='fg=#4c4f69'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#4c4f69'

# --- Initialization ---
export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# --- Paths ---
# FPATH (zsh completions)
fpath_add="$HOME/.zsh/completions"
if [[ ":$FPATH:" != *":$fpath_add:"* && -d "$fpath_add" ]]; then
  FPATH="$fpath_add:$FPATH"
fi

# PATH (prioritize and remove duplicates)
typeset -U path  # Deduplicate automatically

paths_to_prepend=(
  "$HOME/.local/bin/adb"
  "$HOME/.local/bin/activitywatch"
  "$HOME/.cargo/bin"
  "$HOME/go/bin"
  "$HOME/.local/bin/windsurf"
  "$HOME/.local/bin"
  "/usr/local/bin"
  "$HOME/bin"
  "$HOME/.local/bin/libwebp/bin/"
)

for p in "${paths_to_prepend[@]}"; do
  [[ -d "$p" ]] && path=("$p" $path)
done

# Add ~/.local/bin/* subdirectories
for dir in "$HOME/.local/bin"/*(/N); do
  path=("$dir" $path)
done

# --- Oh My Zsh ---
ZSH_THEME="catppuccin"
CATPPUCCIN_FLAVOR="latte" # Required! Options: mocha, flappe, macchiato, latte
CATPPUCCIN_SHOW_TIME=true  # Optional! If set to true, this will add the current time to the prompt.
CATPPUCCIN_SHOW_HOSTNAME="ssh"  # Optional! Options: never, always, ssh
plugins=(
  git
  aliases
  docker
  dotenv
  rsync
  ssh
  vscode
  you-should-use
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-bat
)

source $ZSH/oh-my-zsh.sh

# --- External Tools ---
# Cargo
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# Deno
[[ -f "$HOME/.deno/env" ]] && . "$HOME/.deno/env"

# Ghostty
if [[ -n $GHOSTTY_RESOURCES_DIR && -f "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration" ]]; then
  source "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration"
fi

# LM Studio
[[ -d "$HOME/.lmstudio/bin" ]] && path+=("$HOME/.lmstudio/bin")

# Local env
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

# --- Aliases & Functions ---
alias sctl='run0 systemctl'
alias uctl='systemctl --user'
# alias check-quadlets='podman run --rm -v $(pwd):/etc/containers/systemd:z ghcr.io/braccae/coreos:latest /usr/libexec/podman/quadlet -dryrun'

# Conditional functions
py() {
  local venv="$HOME/.pyenv/bin/activate"
  [[ -f "$venv" ]] && source "$venv" || echo "No venv found at $venv"
}

if (( $+commands[piper-tts] && $+commands[aplay] )); then
  speak() {
    piper-tts --model ~/.local/share/models/en_GB-northern_english_male-medium.onnx --output-raw | aplay -r 22050 -f S16_LE -t raw -
  }
fi

# --- Environment Variables ---
export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/.config/ansible_vault_password"
export HIST_STAMPS="yyyy-mm-dd"
export PGPASSFILE="$HOME/.config/pgpass"

# --- Commands ---
quadlet-linter() {
  local user_mode=false
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --user) user_mode=true; shift ;;
      *) shift ;;
    esac
  done

  if [[ "$user_mode" == true ]]; then
    systemd-run --user --wait --pipe --quiet --collect --unit="quadlet-linter" \
      --property "BindPaths=$(pwd):$HOME/.config/containers/systemd" \
      /usr/libexec/podman/quadlet -user -dryrun 2>&1 > /dev/null
  else
    systemd-run --user --wait --pipe --collect --unit="quadlet-linter" \
      --property "BindPaths=$(pwd):/etc/containers/systemd" \
      /usr/libexec/podman/quadlet -dryrun 2>&1 > /dev/null
  fi
}
# --- Rice ---

# Function to execute before the prompt is displayed
precmd() {
  # Check if a specific variable is set. This variable acts as a flag.
  if [[ -n "$NEW_LINE_FLAG" ]]; then
    # If the flag is set (i.e., not the first prompt), print a newline
    print ""
  else
    # If the flag is not set (i.e., the first prompt), set the flag and do nothing else
    NEW_LINE_FLAG=1
  fi
}

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/pants/.lmstudio/bin"
# End of LM Studio CLI section

