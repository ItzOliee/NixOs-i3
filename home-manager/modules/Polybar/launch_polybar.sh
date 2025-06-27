#!/bin/sh

# Path to pywal colors JSON
colors_json="$HOME/.cache/wal/colors.json"

# Check if jq is installed
if ! command -v jq &>/dev/null; then
  echo "Error: jq is required but not installed. Please install jq."
  exit 1
fi

# Read colors from pywal JSON and export as env vars
export WAL_BASE=$(jq -r '.colors.color0' "$colors_json")
export WAL_TEXT=$(jq -r '.colors.color7' "$colors_json")
export WAL_SURFACE=$(jq -r '.colors.color8' "$colors_json")
export WAL_OVERLAY=$(jq -r '.colors.color4' "$colors_json")
export WAL_BLUE=$(jq -r '.colors.color6' "$colors_json")
export WAL_RED=$(jq -r '.colors.color1' "$colors_json")

# Kill any existing polybar instance named mainBar (optional)
killall -q polybar

# Launch polybar
polybar mainBar &

echo "Polybar launched with pywal colors."

