#!/bin/bash
while true; do
  BATTERY=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
  STATUS=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)

  if [ "$STATUS" = "Discharging" ]; then
    if [ "$BATTERY" -le 10 ]; then
      notify-send -u critical "󰂎 Battery Critical" "${BATTERY}% — plug in now!" -t 0
    elif [ "$BATTERY" -le 20 ]; then
      notify-send -u normal "󰁺 Battery Low" "${BATTERY}% remaining" -t 5000
    fi
  elif [ "$STATUS" = "Charging" ] && [ "$BATTERY" -eq 100 ]; then
    notify-send "󰁹 Battery Full" "100% — unplug charger" -t 5000
  fi

  sleep 60
done
