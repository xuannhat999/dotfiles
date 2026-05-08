#!/bin/bash

# Class cụ thể khi chạy gytm qua kitty
CLASS="gytm-tui"
SPECIAL_WS="special:music"
SPECIAL_NAME="music"

CURRENT_WS=$(hyprctl activewindow -j | jq -r '.workspace.name // empty')

CLIENT_EXISTS=$(hyprctl clients | grep -q "class: $CLASS" && echo "true" || echo "false")

if [ "$CLIENT_EXISTS" = "true" ]; then
  if [ "$CURRENT_WS" = "$SPECIAL_WS" ]; then
    hyprctl dispatch togglespecialworkspace "$SPECIAL_NAME"
  else
    hyprctl dispatch togglespecialworkspace "$SPECIAL_NAME"
  fi
else
  if [ "$CURRENT_WS" = "$SPECIAL_WS" ]; then
    kitty --class "$CLASS" -e gytm &
  else
    hyprctl dispatch togglespecialworkspace "$SPECIAL_NAME"
    hyprctl dispatch exec "[workspace special:$SPECIAL_NAME] kitty --class $CLASS -e gytm"
  fi
fi
