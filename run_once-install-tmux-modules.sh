#!/bin/sh

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
  cd "$TPM_DIR" && git pull --ff-only
fi
"$TPM_DIR"/bin/install_plugins
"$TPM_DIR"/bin/update_plugins all
