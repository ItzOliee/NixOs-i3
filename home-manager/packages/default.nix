{ pkgs, ... }:

with pkgs;
let
  default-python = python3.withPackages (python-packages:
    with python-packages; [
      pip
      i3ipc
    ]);

  nixpkgs.config.allowUnfreePredicate = true;

in {
  home.packages = with pkgs; [

   # MISC
     picom


   # TERMINAL
    kitty
    yazi
    any-nix-shell
    fastfetch
    zip
    unrar
    unzip
    tree
    gnupg
    fish
    starship
    htop
    # DEVELOPMENT
    openjdk
    default-python
    git
    jq
    nodejs 
    # SYSADMIN


    # OFFICE
    firefox
    neovim
    vim
    google-chrome
    pywalfox-native

    # DEFAULT
    pavucontrol
    vesktop
    spotify
    blueman
    feh 
    dunst
    libnotify
    rofi
    zenity   
    bc
    ffmpeg
     # GAMES
  ];


}
