#!/bin/sh

ICON_ON="󰄰"
ICON_OFF="󰄱"

PICOM_LOG="$HOME/.cache/picom.log"
PICOM_CONFIG="$HOME/.config/picom/picom.conf"

# Export X env vars (adjust if your DISPLAY or XAUTHORITY differ)
export DISPLAY=${DISPLAY:-:0}
export XAUTHORITY=${XAUTHORITY:-$HOME/.Xauthority}

if [[ "$1" == "toggle" ]]; then
    if pgrep -x "picom" > /dev/null; then
        pkill -x picom
        notify-send -u low "Picom" "❌ Compositor disabled"
    else
        rm -f "$PICOM_LOG"
        # Run Picom using setsid to fully detach it from the script/Polybar process
        setsid picom --config "$PICOM_CONFIG" >"$PICOM_LOG" 2>&1 < /dev/null &
        sleep 1
        if pgrep -x "picom" > /dev/null; then
            notify-send -u low "Picom" "✅ Compositor enabled"
        else
            notify-send -u critical "Picom" "⚠️ Failed to start"
            notify-send -u low "Picom Log" "$(tail -n 5 $PICOM_LOG)"
        fi
    fi
elif pgrep -x "picom" > /dev/null; then
    echo "$ICON_ON"
else
    echo "$ICON_OFF"
fi
