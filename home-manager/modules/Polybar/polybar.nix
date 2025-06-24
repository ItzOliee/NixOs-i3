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
    [bar/example]
    width = 100%
    height = 27
    background = #222
    foreground = #dfdfdf
    font-0 = Noto Sans:size=10;2
    modules-left = xworkspaces
    modules-right = cpu date

    [settings]
    screenchange-reload = true

    [module/xworkspaces]
    type = internal/xworkspaces
    label-active = %name%
    label-active-background = #5e81ac
    label-active-underline = #81a1c1
    label-occupied = %name%
    label-urgent = %name%
    label-empty =

    [module/cpu]
    type = internal/cpu
    interval = 2
    format = CPU %percentage:2%%

    [module/date]
    type = custom/script
    exec = /home/oli/.config/home-manager/modules/Polybar/scripts/time.sh
  #  click-right = /home/denis/.dotfiles/.config/polybar/custom/scripts/rofi-calendar-menu.sh
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
