#!/usr/bin/env bash

# =========================
#  setup-zsh.sh
# =========================
# installs antidote and links the zsh config into $HOME.
# existing files are backed up; ~/.zshrc.local is left alone.

set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
stamp="$(date +%Y%m%d-%H%M%S)"

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required to install antidote." >&2
  exit 1
fi

if [ ! -d "$(brew --prefix)/opt/antidote" ]; then
  brew install antidote
fi

link() {
  local src="$repo_dir/zsh/$1"
  local dest="$HOME/$1"

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "$dest already linked"
    return
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.bak.$stamp"
    echo "backed up $dest to $dest.bak.$stamp"
  fi

  ln -s "$src" "$dest"
  echo "linked $dest -> $src"
}

link .zshrc
link .zsh_plugins.txt
