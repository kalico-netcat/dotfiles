export PATH="$HOME/.local/bin:$PATH"

# Docker CLI completions (compinit runs from the plugin list)
fpath=($HOME/.docker/completions $fpath)

# source antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
antidote load

# up/down arrows cycle through history matching what's typed
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# machine-specific settings
if [[ -f ~/.zshrc.local ]]; then source ~/.zshrc.local; fi
