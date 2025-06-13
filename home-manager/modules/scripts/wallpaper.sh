#!/bin/sh

DIR="$HOME/Wallpapers/"
BG=$(find "$DIR" -type f \( -iname "*.jpeg" -o -iname "*.png" -o -iname "*.jpg" \) | shuf -n 1)

if [ -n "$BG" ]; then
    feh --bg-scale "$BG" &&
    wal -i "$BG" --saturate 0.7 -n -b 010101 &&
    ~/.config/home-manager/modules/scripts/starship_pywal.sh &&
    ~/.config/home-manager/modules/scripts/pywaldunst.sh > ~/.config/dunst/dunstrc

    sleep 0.2  # Give time for dunstrc to settle
    pkill dunst
    dunst &

    dunstify "New Wallpaper Set" "$(basename "$BG")"
fi
