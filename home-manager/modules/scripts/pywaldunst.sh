#!/bin/sh
source ~/.cache/wal/colors.sh

cat <<EOF

[global]
# Display
follow = mouse
width = 350
height = (0, 300)
origin = top-right
offset = (35, 35)
indicate_hidden = yes
notification_limit = 5
gap_size = 12
padding = 12
horizontal_padding = 20
frame_width = 2
frame_color = "${color0:-#1e1e2e}"
corner_radius = 10
transparency = 10
sort = no

# Progress bar
progress_bar_frame_width = 0
progress_bar_corner_radius = 3

# Colors
foreground = "${foreground:-#cdd1dc}"
highlight = "${color4:-#2274d5}, ${color6:-#82aad9}"

# Text
font = Noto Sans CJK JP 10
markup = full
format = "<small>%a</small>\n<b>%s</b>\n%b"
alignment = left
vertical_alignment = center
show_age_threshold = -1
hide_duplicate_count = false

[urgency_low]
background = "${background:-#282828}AA"
foreground = "${foreground:-#ebdbb2}"
timeout = 10

[urgency_normal]
background = "${color3:-#3c3836}AA"
foreground = "${foreground:-#ebdbb2}"
timeout = 10

[urgency_critical]
background = "${color1:-#cc241d}DD"
foreground = "${color7:-#fbf1c7}"
timeout = 0

EOF

