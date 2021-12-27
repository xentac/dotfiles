#!/bin/sh

MINPAC_DIR="$HOME/.config/nvim/pack/minpac/opt/minpac"

if [ -x "$(command -v nvim)" ]; then
  if [ ! -d "$MINPAC_DIR" ]; then
    git clone https://github.com/k-takata/minpac.git "$MINPAC_DIR"
  else
    cd "$MINPAC_DIR" && git pull --ff-only
  fi
  nvim --headless +PackUpdateAndQuit +q
fi

