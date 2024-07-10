#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

# Run xidlehook
xidlehook \
  `# Reset timers after sleep` \
  --detect-sleep \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 600 seconds, undim if user becomes active` \
  --timer 600 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  `# Undim & lock after 60 more seconds` \
  --timer 60 \
    'setxkbmap -model pc104 -layout us,us -variant dvorak, -option -option grp:alts_toggle; xmodmap ~/.Xmodmap; xrandr --output "$PRIMARY_DISPLAY" --brightness 1; i3lock -c 002233' \
    '' \
  `# Finally, suspend an hour after it locks` \
  --timer 3600 \
   'systemctl suspend' \
   ''
