#!/bin/sh

ICON_ON=""
ICON_OFF=""

PICOM_LOG="$HOME/.cache/picom.log"
PICOM_CONFIG="$HOME/.config/picom/picom.conf"

export DISPLAY=${DISPLAY:-:0}
export XAUTHORITY=${XAUTHORITY:-$HOME/.Xauthority}

NOTIFY="notify-send -u normal -t 3000 -h string:x-dunst-stack-tag:picom"

if [[ "$1" == "toggle" ]]; then
    if pgrep -x "picom" > /dev/null; then
        pkill -x picom
        $NOTIFY "Picom" "Compositor disabled"
    else
        rm -f "$PICOM_LOG"
        setsid picom --config "$PICOM_CONFIG" >"$PICOM_LOG" 2>&1 < /dev/null &
        sleep 1
        if pgrep -x "picom" > /dev/null; then
            $NOTIFY "Picom" "Compositor enabled"
        else
            notify-send -u critical -t 5000 -h string:x-dunst-stack-tag:picom "Picom" "⚠️ Failed to start"
            notify-send -u normal -t 5000 -h string:x-dunst-stack-tag:picom "Picom Log" "$(tail -n 5 $PICOM_LOG)"
        fi
    fi
elif pgrep -x "picom" > /dev/null; then
    echo "$ICON_ON"
else
    echo "$ICON_OFF"
fi

