#!/bin/bash

current=$(powerprofilesctl get)

case $current in
power-saver)
  powerprofilesctl set balanced
  notify-send "Power Mode" "  Balanced" -h string:x-canonical-private-synchronous:powermode
  ;;
balanced)
  powerprofilesctl set performance
  notify-send "Power Mode" " Performance" -h string:x-canonical-private-synchronous:powermode
  ;;
performance)
  powerprofilesctl set power-saver
  notify-send "Power Mode" " Power Saver" -h string:x-canonical-private-synchronous:powermode
  ;;
esac
