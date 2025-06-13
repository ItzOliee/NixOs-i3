{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  home.activation.generateDunstrc = ''
    mkdir -p ${config.home.homeDirectory}/.config/dunst
    ${config.home.homeDirectory}/.config/home-manager/modules/scripts/pywaldunst.sh > ${config.home.homeDirectory}/.config/dunst/dunstrc
  '';


systemd.user.services.dunst = {
    Unit = {
      Description = "Dunst notification daemon";
      After = "graphical-session.target";
    };

    Service = {
      ExecStart = "${pkgs.dunst}/bin/dunst -config ${config.home.homeDirectory}/.config/dunst/dunstrc";
      Restart = "on-failure";
      RestartSec = 5;
      Environment = [
      "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus"
      ];
    };
  };
}
