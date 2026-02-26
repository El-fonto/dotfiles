# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
. "$HOME/.cargo/env"
eval "$(mise activate bash)"
eval "$(mise activate bash)"

alias emacs="$HOME/.config/emacs/bin/doom emacs"
alias ac="python ~/Work/Scripts/nueva_correccion.py"
export PATH="$HOME/.config/emacs/bin:$PATH"

export SYSTEMD_EDITOR=nvim
