#!/bin/bash

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}' | cut -d. -f1)
is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -c "MUTED")

if [ "$is_muted" -ne 0 ]; then
  icon="/usr/share/icons/Papirus/48x48/status/notification-audio-volume-muted.svg"
  msg="Muted"
else
  icon="/usr/share/icons/Papirus/48x48/status/notification-audio-volume-high.svg"
  msg="$volume%"
fi

notify-send \
  -i "$icon" \
  -h string:x-canonical-private-synchronous:volume \
  "Volume" "$msg"
