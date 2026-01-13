# Aliases I need to live
alias cl="clear"
alias x="exit"
alias ask="bash .ask.sh"

# --- Path augmentations ---

set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH

# --- Miscellaneous ---

set -x EDITOR "nvim"

# -- Startup ---

starship init fish | source

