#!/bin/bash
THEME="$HOME/.config/rofi/power-menu-style.rasi"

chosen=$(printf "  Shutdown\n  Reboot\n  Lock\n󰤄  Suspend\n󰍃  Logout" |
  rofi -dmenu \
    -p "Power Menu" \
    -theme "$THEME" \
    -i \
    -no-custom \
    -kb-select-1 "s" -kb-select-2 "r" -kb-select-3 "u" -kb-select-4 "l")

case "$chosen" in
*Shutdown) systemctl poweroff ;;
*Reboot) systemctl reboot ;;
*Lock)
  hyprlock
  ;;
*Suspend)
  systemctl suspend
  hyprlock
  ;;
*Logout) hyprctl dispatch 'hl.dsp.exit()' ;;
esac
