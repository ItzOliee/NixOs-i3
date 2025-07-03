{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    config = ./config.ini;
    script = ''/home/oli/.config/home-manager/modules/Polybar/launch_polybar.sh'';
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
    };
  };
}
