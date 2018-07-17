# Setup fzf
# ---------
if [[ ! "$PATH" == */home/talyson/.fzf/bin* ]]; then
  export PATH="$PATH:/home/talyson/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/talyson/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/talyson/.fzf/shell/key-bindings.zsh"

