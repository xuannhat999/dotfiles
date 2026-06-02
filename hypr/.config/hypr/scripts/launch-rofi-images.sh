#!/usr/bin/env bash

TARGET_DIR="$HOME/Pictures"

RAW_LIST=$(find "$TARGET_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -printf "%T@ %p\n" | sort -rn | cut -d' ' -f2-)

ROFI_INPUT=""
while IFS= read -r line; do
  if [ -n "$line" ]; then
    ROFI_INPUT+="${line}\0icon\x1f${line}\n"
  fi
done <<<"$RAW_LIST"

SELECTED_IMAGE=$(echo -e "$ROFI_INPUT" | rofi -dmenu -i \
  -p "󰋩 Copy Image" \
  -show-icons \
  -theme "~/.config/rofi/style-images.rasi")

if [ -n "$SELECTED_IMAGE" ] && [ -f "$SELECTED_IMAGE" ]; then
  if file --mime-type "$SELECTED_IMAGE" | grep -qE 'image/'; then
    wl-copy <"$SELECTED_IMAGE"
    notify-send "Clipboard" "Đã copy ảnh vào bộ nhớ tạm!" --icon="$SELECTED_IMAGE"
  fi
fi
