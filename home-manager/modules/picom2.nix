{ config, pkgs, ... }:

let
  picomConfigPath = ".config/picom/picom.conf";
in {
  home.packages = with pkgs; [
  ];

  home.file.${picomConfigPath}.text = ''
    ########################################
    # Picom Configuration
    ########################################

    backend = "glx";
    vsync = true;

    ########################################
    # Shadow
    ########################################
    shadow = true;
    shadow-radius = 12;
    shadow-offset-x = -15;
    shadow-offset-y = -15;
    shadow-opacity = 0.7;
    shadow-exclude = "class_g = 'i3-frame' || class_g = 'Conky' || window_type = 'dock' || window_type = 'desktop'";

    ########################################
    # Fading
    ########################################
    fading = true;
    fade-in-step = 0.03;
    fade-out-step = 0.03;

    ########################################
    # Transparency
    ########################################
    inactive-opacity = 0.85;
    active-opacity = 1.0;
    frame-opacity = 0.9;
    blur-background = true;
    blur-method = "kernel";
    blur-strength = 7;

    ########################################
    # Other
    ########################################
    vsync = true;
    mark-wmwin-focused = true;
    use-ewmh-active-win = true;

    ########################################
    # Exclude
    ########################################
    opacity-rule = [
      "90:class_g = 'kitty'",
      "90:class_g = 'Alacritty'",
    ];
  '';
}
