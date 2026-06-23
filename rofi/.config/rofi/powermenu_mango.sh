#!/bin/bash
THEME="$HOME/.config/rofi/power-menu-style.rasi"
chosen=$(printf " Shutdown\n Reboot\n Lock\n󰤄 Suspend\n󰍃 Logout" |
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
  swayidle -w &
  swaylock
  killall swayidle 2>/dev/null || true
  ;;

*Suspend)
  swaylock &
  systemctl suspend
  ;;

*Logout)
  loginctl terminate-user "$USER"
  ;;
esac
