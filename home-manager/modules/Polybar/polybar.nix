{ config, pkgs, ... }:

let
  polybarConfigPath = ".config/polybar/config.ini";
  polybarLaunchPath = ".config/polybar/launch.sh";
in
{
  home.packages = with pkgs; [
  ];

  # Polybar config file
  home.file.${polybarConfigPath}.text = ''
   
   
   [colors]
    background = #1F1F1F
    background-alt = #373B41
    foreground = #FFFFFF
    primary = #C5C8C6
    secondary = #8ABEB7
    alert = #A54242
    disabled = #707880  
  

    [bar/example]
    width = 100%
    height = 30
    background = #88000000
    foreground = #dfdfdf
    font-0 = Hack Nerd Font:size=12;3
    modules-left = i3
    modules-right = cpu
    modules-center = date

    [settings]
    screenchange-reload = true
    
     [module/i3]
     type = internal/i3
     format = <label-state>

     # Appearance of focused workspace
     label-focused = %icon% %name%
     label-focused-padding = 2
     label-focused-background = #5e81ac
     label-focused-foreground = #ffffff

     # Appearance of unfocused workspace
     label-unfocused = %icon% %name%
     label-unfocused-padding = 2
     label-unfocused-foreground = #d8dee9

     # Appearance of visible but not focused workspace
     label-visible = %icon% %name%
     label-visible-padding = 2
     label-visible-background = #88c0d0
     label-visible-foreground = #2e3440

     # Appearance of urgent workspace
     label-urgent = %icon% %name%
     label-urgent-padding = 2
     label-urgent-background = #bf616a
     label-urgent-foreground = #ffffff

     # Optional behavior
     enable-click = true
     enable-scroll = false
     wrapping-scroll = false

     # Automatically remove empty workspaces (optional)
     strip-wsnumbers = false
     index-sort = true
     pin-workspaces = true

     # Icons (requires FontAwesome or Nerd Fonts)
     ws-icon-0 = 1;
     ws-icon-1 = 2;
     ws-icon-2 = 3;
     ws-icon-3 = 4;
     ws-icon-4 = 5;
     ws-icon-default = 

  
    [module/cpu]
    type = internal/cpu
    interval = 2
    format = CPU %percentage:2%%

    [module/date]
    type = custom/script
    exec = /home/oli/.config/home-manager/modules/Polybar/scripts/time.sh
    click-right = /home/oli/.config/home-manager/Polybar/scripts/rofi-calendar-menu.sh
    interval = 10


  '';

  # Polybar launch script
  home.file.${polybarLaunchPath}.text = ''
    #!/usr/bin/env bash
    killall -q polybar
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
    polybar example &
  '';

}
