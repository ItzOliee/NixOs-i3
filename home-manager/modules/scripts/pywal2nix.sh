#!/bin/sh

WAL_JSON="$HOME/.cache/wal/colors.json"
OUT_FILE="$HOME/.config/home-manager/modules/pywal-colors.nix"



if [ ! -f "$WAL_JSON" ]; then
  echo "colors.json not found. Run pywal first."
  exit 1
fi

echo "{" > "$OUT_FILE"

# Add special colors
jq -r '.special | to_entries[] | "  \(.key) = \"" + .value + "\";"' "$WAL_JSON" >> "$OUT_FILE"

# Add base colors
jq -r '.colors | to_entries[] | "  \(.key) = \"" + .value + "\";"' "$WAL_JSON" >> "$OUT_FILE"

echo "}" >> "$OUT_FILE"

echo "✅ Generated $OUT_FILE"
