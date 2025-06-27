{ config, pkgs, ... }:

let
  i3ConfigPath = ".config/i3/config";
in {
  home.packages = with pkgs; [
  ];

home.file.".config/home-manager/scripts/wallpaper.sh".source = ./scripts/wallpaper.sh;


  home.file.${i3ConfigPath}.text = ''
    ########################################
    # Load Pywal colors
    ########################################
    include ~/.cache/wal/colors.sway

    ########################################
    # General Settings
    ########################################
    set $mod Mod4
    font pango:Hack Nerd Font 10

    gaps inner 10
    gaps outer 10
    smart_gaps on
    default_border none

for_window [class="Dunst"] floating enable

    ########################################
    # Workspace Bindings
    ########################################
    set $ws1 "1: "
    set $ws2 "2: "
    set $ws3 "3: "
    set $ws4 "4: "
    set $ws5 "5: "

    bindsym $mod+Return exec kitty
    bindsym $mod+r exec rofi -show drun
    bindsym $mod+Shift+q kill
    bindsym $mod+Shift+r restart
    bindsym $mod+Shift+e exit

    bindsym $mod+1 workspace $ws1
    bindsym $mod+2 workspace $ws2
    bindsym $mod+3 workspace $ws3
    bindsym $mod+4 workspace $ws4
    bindsym $mod+5 workspace $ws5

    bindsym $mod+h focus left
    bindsym $mod+j focus down
    bindsym $mod+k focus up
    bindsym $mod+l focus right

    ########################################
    # Bar
    ########################################

  ##########################################
  # Startup
  ##########################################
   exec --no-startup-id xrandr --output Virtual-1 --mode 1920x1080 
   exec --no-startup-id /home/oli/.config/home-manager/modules/scripts/wallpaper.sh
   exec --no-startup-id picom --config ~/.config/picom/picom.conf
   exec_always --no-startup-id /home/oli/.config/home-manager/scripts/autotiling.py


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

  '';

}
