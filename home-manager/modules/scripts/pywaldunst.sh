#!/usr/bin/env bash
# Source pywal colors (adjust path if needed)
source ~/.cache/wal/colors.sh

cat <<EOF
[global]
geometry = "300x50-10+10"
timeout = 3000

[urgency_low]
background = "${background:-#282828}"
foreground = "${foreground:-#ebdbb2}"
timeout = 10

[urgency_normal]
background = "${color3:-#3c3836}"
foreground = "${foreground:-#ebdbb2}"
timeout = 10

[urgency_critical]
background = "${color1:-#cc241d}"
foreground = "${color7:-#fbf1c7}"
timeout = 0
EOF

