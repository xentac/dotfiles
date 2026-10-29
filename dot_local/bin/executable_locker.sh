#!/usr/bin/env bash

setxkbmap -model pc104 -layout us,us -variant dvorak, -option grp:alt_shift_toggle; xmodmap ~/.Xmodmap; i3lock --nofork -c 002233
