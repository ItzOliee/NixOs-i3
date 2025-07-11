{ config, pkgs, ... }:

let
  picomConfigPath = ".config/picom/picom.conf";
in {
  home.packages = with pkgs; [
  ];
 
   home.file.${picomConfigPath}.text = ''

# Backend
backend = "glx";
xrender-sync-fence = false
use-damage=false

# Enable vsync
vsync = false;

# Enable shadows (optional)
shadow = true;

# Enable blur
blur: {
  method = "dual_kawase";
  strength = 4
};

# Blur background of windows
blur-background = true;
blur-background-frame = true;
blur-background-fixed = false;

# Rounded corners
corner-radius = 10;
round-borders = 1;
rounded-corners-exclude = [
];



# Specify which windows to blur (optional; can blur all)
blur-background-exclude = [
  "class_g = 'Polybar'",
  "window_type = 'desktop'"
];

# Fading (optional)
fading = true;
fade-in-step = 0.03;
fade-out-step = 0.03;

# Opacity (optional, for translucent inactive windows)
inactive-opacity = 0.75;
active-opacity = 0.8;

# Enable
use-dock-shadow = false;
detect-rounded-corners = true;
detect-client-opacity = true;

# Exclude conditions (optional, refine as needed)
shadow-exclude = [
  "class_g = 'Conky'",
  "class_g = 'slop'",
  "class_g = 'Polybar'"
];

# Animations
animations = true;
animation-stiffness = 300.0;
animation-dampening = 22.0;
animation-clamping = true;
animation-mass = 1;
animation-for-open-window = "fly-in";
animation-for-close-window = "geometry-change";
animation-for-menu-window = "slide-down";



'';
}
