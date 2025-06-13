#!/usr/bin/env bash
# Generate dunst config using pywal colors

cat <<EOF
[global]
geometry = "300x50-10+10"
timeout = 3000

[urgency_low]
background = "${WAL_BACKGROUND:-#282828}"
foreground = "${WAL_FOREGROUND:-#ebdbb2}"
timeout = 10

[urgency_normal]
background = "${WAL_COLOR3:-#3c3836}"  # example fallback
foreground = "${WAL_FOREGROUND:-#ebdbb2}"
timeout = 10

[urgency_critical]
background = "${WAL_COLOR1:-#cc241d}"
foreground = "${WAL_COLOR7:-#fbf1c7}"
timeout = 0
EOF

