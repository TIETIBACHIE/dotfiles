#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
CURRENT=$(awww query | grep -oP '(?<=image: ).*')
FILES=("$WALLPAPER_DIR"/*)
NUM=${#FILES[@]}

for i in "${!FILES[@]}"; do
    if [[ "${FILES[$i]}" == "$CURRENT" ]]; then
        NEXT="${FILES[$(( (i + 1) % NUM ))]}"
        awww img "$NEXT" --transition-type wave --transition-duration 2
        exit
    fi
done

awww img "${FILES[0]}" --transition-type wave --transition-duration 2
