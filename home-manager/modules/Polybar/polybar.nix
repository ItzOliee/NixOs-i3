{ pkgs, ... }:

{
  # Provide the static template for Home Manager
  home.file.".config/polybar/config.template".source = /home/oli/.config/home-manager/modules/Polybar/config.template;
  home.file.".config/polybar/launch-polybar.sh".source = /home/oli/.config/home-manager/modules/Polybar/launch-polybar.sh;

  services.polybar = {
    enable = true;
    # Point to the static template (exists)
    config = ./config.template;

    # Launch script generates config + runs polybar
    script = "/home/oli/.config/polybar/launch-polybar.sh";

    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
    };
  };
}
