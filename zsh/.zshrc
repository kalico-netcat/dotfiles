export PATH="$HOME/.local/bin:$PATH"

# Docker CLI completions (compinit runs from the plugin list)
fpath=($HOME/.docker/completions $fpath)

# source antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

# no highlight on history substring search matches
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

# initialize plugins statically with ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
antidote load

# colors for typed commands (terminal palette names)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[comment]='fg=8'

# up/down arrows cycle through history matching what's typed
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# prompt (config: ~/.config/starship.toml)
if command -v starship >/dev/null; then eval "$(starship init zsh)"; fi

# machine-specific settings
if [[ -f ~/.zshrc.local ]]; then source ~/.zshrc.local; fi
