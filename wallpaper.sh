#!/bin/bash

DIR="$HOME/wallpapers/"
BG=$(find "$DIR" -type f \( -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | shuf -n 1)

if [ -n "$BG" ]; then
    swww img "$BG" --transition-duration 1.2 --transition-step 255 --transition-type outer --transition-pos 0,0 &&
    wal -i "$BG" --saturate 0.7 -n -b 010101 &&
    notify-send "New Wallpaper Set" "$(basename "$BG")" &&
    pywalfox update
else
    notify-send "Wallpaper Script" "No image found in $DIR"
fi
