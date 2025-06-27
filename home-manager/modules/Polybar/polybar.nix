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
   
    monitor = Virtual-1 
    width = 960 
    height = 32
    offset-x = 480 
    radius = 10

    background = #88000000
    foreground = #dfdfdf
    
    line-size = 4
    line-color = #f00
       

    font-0 = Hack Nerd Font:size=12;3
   
    padding-left = 8
    padding-right = 8
  
    module-margin-left = 1
    module-margin-right = 2
 

    modules-left = i3 xwindow
    modules-right = cpu
    modules-center = date

    wm-restack = i3

    [settings]
    screenchange-reload = true
   
   [module/i3]
   type = internal/i3
   format = <label-state> <label-mode>
   index-sort = true
   wrapping-scroll = false
   strip-wsnumbers = true
   pin-workspaces = false
   enable-click = true
   enable-scroll = true
   show-empty = true


   label-mode-padding = 2
   label-mode-foreground = #000000
   label-mode-background = #5e81ac  

   label-focused = %name%
   label-focused-background = #88c0d0 
   label-focused-underline = #81a1c1  
   label-focused-foreground = #2e3440  
   label-focused-padding = 2

   label-unfocused = %name%
   label-unfocused-background = #3b4252  
   label-unfocused-foreground = #d8dee9  
   label-unfocused-padding = 2

   label-visible = %name%
   label-visible-background = #434c5e  
   label-visible-underline = #81a1c1
   label-visible-foreground = #eceff4
   label-visible-padding = 2

   label-urgent = %name%
   label-urgent-background = #bf616a 
   label-urgent-foreground = #ffffff 
   label-urgent-padding = 2
 
    [module/cpu]
    type = internal/cpu
    interval = 2
    format = CPU %percentage:2%%

    [module/date]
    type = custom/script
    exec = /home/oli/.config/home-manager/modules/Polybar/scripts/time.sh
    click-right = /home/oli/.config/home-manager/Polybar/scripts/rofi-calendar-menu.sh
    interval = 10



[module/xwindow]
type = internal/xwindow
label = %{T2}%title:0:40:...%%{T-}


  '';

  # Polybar launch script
  home.file.${polybarLaunchPath}.text = ''
    #!/usr/bin/env bash
    killall -q polybar
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
    polybar example &
  '';

}
