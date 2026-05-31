#!/bin/bash
while true; do
    clear
    echo ""
    echo "  󰻠  System"
    echo "  ━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    # CPU
    CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
    echo "  󰍛  CPU"
    echo "     ${CPU}% used"
    echo ""

    # RAM
    RAM_USED=$(free -h | awk '/^Mem:/ {print $3}')
    RAM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
    echo "  󰘚  Memory"
    echo "     ${RAM_USED} / ${RAM_TOTAL}"
    echo ""

    # DISK
    DISK=$(df -h / | awk 'NR==2 {print $3 " / " $2 " (" $5 ")"}')
    echo "  󰋊  Disk"
    echo "     ${DISK}"
    echo ""

    echo "  ━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    # Updates
    UPDATES=$(checkupdates 2>/dev/null | wc -l)
    echo "  󰚰  Updates"
    echo "     ${UPDATES} packages pending"
    echo ""

    echo "  ━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    # Uptime
    UPTIME=$(uptime -p | sed 's/up //')
    echo "  󰥔  Uptime"
    echo "     ${UPTIME}"
    echo ""

    sleep 30
done
