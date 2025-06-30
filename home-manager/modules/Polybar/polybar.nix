{ 
  services.polybar = {
    enable = true;
    config = ./config.ini;

    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
    };
}
