#!/usr/bin/env bash

# =========================
#  setup-tmux.sh
# =========================
# installs tmux config and declared TPM plugins.

set -euo pipefail
tpm_dir="$HOME/.tmux/plugins/tpm"

cp "./.tmux.conf" "$HOME/.tmux.conf"

if [ ! -d "$tpm_dir" ]; then
  mkdir -p "$HOME/.tmux/plugins"
  git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
fi

"$tpm_dir/bin/install_plugins"
