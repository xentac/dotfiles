#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"

run_idlehook() {
  killall xidlehook

  timer=600
  if [ "$1" = "AC" ]; then
    timer=3600
  fi
  # Run xidlehook
  xidlehook \
    `# Reset timers after sleep` \
    --detect-sleep \
    `# Don't lock when there's a fullscreen application` \
    --not-when-fullscreen \
    `# Don't lock when there's audio playing` \
    --not-when-audio \
    `# Dim the screen after 600 seconds, undim if user becomes active` \
    --timer $timer \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness .1' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
    `# Undim & lock after 60 more seconds` \
    --timer 60 \
    'setxkbmap -model pc104 -layout us,us -variant dvorak, -option -option grp:alts_toggle; xmodmap ~/.Xmodmap; xrandr --output "$PRIMARY_DISPLAY" --brightness 1; i3lock -c 002233' \
    '' \
    `# Finally, suspend an hour after it locks` \
    --timer 3600 \
    'systemctl suspend' \
    '' &
}

acpi_listen | while read event; do
  if [[ $event == *"ac_adapter"* ]]; then
    if [[ $event == *"00000001" ]]; then
      echo "AC Plugged In"
      run_idlehook "AC"
    else
      echo "AC Unplugged"
      run_idlehook "battery"
    fi
  fi
done
