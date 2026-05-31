#!/bin/bash
WORKSPACE=$1

if [ "$WORKSPACE" = "1" ]; then
    eww open left-panel
    eww open right-panel
    eww open clock-panel
else
    eww close left-panel
    eww close right-panel
    eww close clock-panel
fi

