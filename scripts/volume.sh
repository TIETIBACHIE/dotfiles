#!/bin/bash
ACTION=$1

case "$ACTION" in
  up)
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;
  down)
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac

VOL=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -oP '\d+(?=%)' | head -1)
MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | grep -c "yes")

if [ -z "$VOL" ]; then exit 1; fi

if [ "$MUTED" -eq 1 ]; then
  notify-send -h string:x-canonical-private-synchronous:volume "󰖁 Muted" -t 1500
else
  notify-send -h string:x-canonical-private-synchronous:volume "󰕾 Volume ${VOL}%" -t 1500 -h "int:value:${VOL}"
fi
