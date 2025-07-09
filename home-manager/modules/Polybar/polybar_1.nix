{ pkgs, ... }:

{
  services.polybar = {
    enable = true;
    config = ./config;
    script = ''/home/oli/.config/home-manager/modules/Polybar/launch-polybar.sh'';
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
    };
  };
}
