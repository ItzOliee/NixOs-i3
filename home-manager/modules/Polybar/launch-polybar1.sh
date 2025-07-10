#!/usr/bin/env bash

# Paths
colors_file="$HOME/.cache/wal/colors.json"
template="$HOME/.config/polybar/config.template"
config="$HOME/.config/polybar/config"

# Extract pywal colors
color1=$(jq -r '.colors.color1' "$colors_file")
color6=$(jq -r '.colors.color6' "$colors_file")
color7=$(jq -r '.colors.color7' "$colors_file")
color8=$(jq -r '.colors.color8' "$colors_file")
foreground=$(jq -r '.special.foreground' "$colors_file")
background=$(jq -r '.special.background' "$colors_file")


# Replace placeholders in template config
sed \
  -e "s|{{COLOR1}}|$color1|g" \
  -e "s|{{COLOR6}}|$color6|g" \
  -e "s|{{COLOR7}}|$color7|g" \
  -e "s|{{COLOR8}}|$color8|g" \
  -e "s|{{FOREGROUND}}|$foreground|g" \
  -e "s|{{BACKGROUND}}|$background|g" \


  "$template" > "$config"

# Kill existing polybar instances
pkill polybar

# Wait to ensure clean exit
sleep 0.5

# Launch polybar with the generated config
polybar mainBar &
