#!/bin/bash
while true; do
    clear
    echo ""
    echo "  󱑎  $(date +"%H:%M")"
    echo "  󰃭  $(date +"%A, %d %B %Y")"
    echo ""
    echo "  ━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "  󰸗  Calendar"
    echo ""
    cal | sed 's/^/     /'
    echo ""
    echo "  ━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "  󰖙  Weather"
    echo ""
    WEATHER=$(curl -s "wttr.in/Singapore?format=%C+%t+%h+%w" 2>/dev/null)
    TEMP=$(curl -s "wttr.in/Singapore?format=%t" 2>/dev/null)
    COND=$(curl -s "wttr.in/Singapore?format=%C" 2>/dev/null)
    HUMID=$(curl -s "wttr.in/Singapore?format=%h" 2>/dev/null)
    WIND=$(curl -s "wttr.in/Singapore?format=%w" 2>/dev/null)
    echo "     $COND"
    echo "    󰔄  $TEMP"
    echo "    󰖎  Humidity: $HUMID"
    echo "    󰜝  Wind: $WIND"
    echo ""
    sleep 300
done
