#!/bin/sh
cat - | awk '/^$/ {nlstack=nlstack "\n";next;} {printf "%s",nlstack; nlstack=""; print;}' >/tmp/buff
nvim -c 'term tail -n 200 /tmp/buff' -c ':only' -c 'nnoremap q :q!<CR>' -c 'map $ g_' </dev/tty
