#!/bin/bash
file=$1
w=$2
h=$3

case $(file --mime-type "$file" -b) in
    image/*)
        chafa --format symbols --colors 256 --size "${w}x${h}" "$file"
        ;;
    text/*)
        bat --color=always --style=numbers --line-range=:200 "$file" 2>/dev/null || cat "$file"
        ;;
    video/*)
        ffmpegthumbnailer -i "$file" -o /tmp/thumb.png -s 0 2>/dev/null
        chafa --format symbols --colors 256 --size "${w}x${h}" /tmp/thumb.png
        ;;
    *)
        file -b "$file"
        ;;
esac
