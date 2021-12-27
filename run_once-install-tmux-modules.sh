#!/bin/sh

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  "$TPM_DIR"/bin/install_plugins
else
  cd "$TPM_DIR" && git pull --ff-only
  "$TPM_DIR"/bin/update_plugins all
fi
