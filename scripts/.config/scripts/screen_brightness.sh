#!/bin/bash

brightness=$(brightnessctl get)
max=$(brightnessctl max)
percent=$((brightness * 100 / max))
icon="/usr/share/icons/Papirus/48x48/status/notification-display-brightness-high.svg"
notify-send \
  -i "$icon" \
  -h string:x-canonical-private-synchronous:brightness \
  -h int:value:"$percent" \
  "Brightness" "$percent%"
