# Set colors from Xresources
# Change 'color7' and 'color2' to whatever colors you want i3 to use 
# from the generated scheme.
# NOTE: The '#f0f0f0' in the lines below is the color i3 will use if
# it fails to get colors from Xresources.
set_from_resource $fg i3wm.color7 #f0f0f0
set_from_resource $bg i3wm.color2 #f0f0f0

# class                 border  backgr. text indicator child_border
client.focused          $bg     $bg     $fg  $bg       $bg
client.focused_inactive $bg     $bg     $fg  $bg       $bg
client.unfocused        $bg     $bg     $fg  $bg       $bg
client.urgent           $bg     $bg     $fg  $bg       $bg
client.placeholder      $bg     $bg     $fg  $bg       $bg

client.background       $bg

# i3status
bar {
    status_command i3status
    colors {
        background $bg
        statusline $fg
        separator $fg
    }
}

# PROTIP: You can also dynamically set dmenu's colors this way:
bindsym $mod+d exec dmenu_run -nb "$fg" -nf "$bg" -sb "$bg" -sf "$fg"
