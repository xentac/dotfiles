#!/bin/sh

if [ -x "$(command -v nvim)" ]; then
  nvim --headless "+Lazy! sync" +qa
fi
