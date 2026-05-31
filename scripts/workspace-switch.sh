#!/bin/bash
WORKSPACE=$1

if [ "$WORKSPACE" = "1" ]; then
    eww open left-panel
    eww open right-panel
else
    eww close left-panel
    eww close right-panel
fi
