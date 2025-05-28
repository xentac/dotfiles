#!/bin/sh

if [ -x "$(command -v nvim)" ]; then
  nvim --headless "+Lazy! sync" +qa
  nvim --headless +'KittyScrollbackGenerateKittens'
fi
