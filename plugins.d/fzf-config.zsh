# Setup fzf
# ---------
if [[ ! "$PATH" == */home/skuta/scripts/fzf-zsh/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/skuta/scripts/fzf-zsh/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/skuta/scripts/fzf-zsh/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/skuta/scripts/fzf-zsh/shell/key-bindings.zsh"
