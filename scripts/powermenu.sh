#!/bin/bash

CHOICES="󰌾 Lock\n󰍃 Logout\n󰤄 Suspend\n󰜉 Reboot\n󰐥 Shutdown"

CHOSEN=$(echo -e "$CHOICES" | rofi -dmenu \
  -p "Power" \
  -theme ~/.config/rofi/ocean.rasi \
  -i)

case "$CHOSEN" in
  "󰌾 Lock") hyprlock ;;
  "󰍃 Logout") hyprctl dispatch exit ;;
  "󰤄 Suspend") systemctl suspend ;;
  "󰜉 Reboot") systemctl reboot ;;
  "󰐥 Shutdown") systemctl poweroff ;;
esac
