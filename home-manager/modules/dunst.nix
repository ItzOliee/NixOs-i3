{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dunst
  ];

  xdg.configFile."dunst/dunstrc".text = ''
    [global]
    geometry = "300x50-10+10"
    timeout = 3000

    [urgency_low]
    background = "#282828"
    foreground = "#ebdbb2"
    timeout = 10

    [urgency_normal]
    background = "#3c3836"
    foreground = "#ebdbb2"
    timeout = 10

    [urgency_critical]
    background = "#cc241d"
    foreground = "#fbf1c7"
    timeout = 0
  '';

  systemd.user.services.dunst = {
    Unit = {
      Description = "Dunst notification daemon";
      After = "graphical-session.target";
    };

    Service = {
      ExecStart = "${pkgs.dunst}/bin/dunst";
      Restart = "on-failure";
      RestartSec = 5;
      Environment = [
      #  "DISPLAY=:0"
        "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus"
      ];
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
