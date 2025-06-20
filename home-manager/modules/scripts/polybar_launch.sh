#!/usr/bin/env bash

# Kill any running polybar instances
killall -q polybar

# Wait until processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch Polybar with your config
polybar main &
