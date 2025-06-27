DIR="$HOME/Wallpapers/"
BG=$(find "$DIR" -type f \( -iname "*.jpeg" -o -iname "*.png" -o -iname "*.jpg" \) | shuf -n 1)

if [ -n "$BG" ]; then
    # Set wallpaper with feh
    feh --bg-scale "$BG" &&

    # Run pywal on the selected wallpaper with saturation, no change to background color
    wal -i "$BG" --saturate 0.7 -n -b 010101 &&

    # Run your existing scripts that apply pywal colors to starship and dunst
    ~/.config/home-manager/modules/scripts/starship_pywal.sh &&
    ~/.config/home-manager/modules/scripts/pywaldunst.sh > ~/.config/dunst/dunstrc

    sleep 0.2  # Give time for dunstrc to settle

    # Restart dunst to apply new colors
    pkill dunst
    dunst &

    # Restart polybar
    pkill polybar
    # Launch your Polybar (adjust as needed)
    ~/.config/home-manager/modules/Polybar/launch_polybar.sh &

    # Notify with dunstify
    dunstify "New Wallpaper Set" "$(basename "$BG")"
fi

