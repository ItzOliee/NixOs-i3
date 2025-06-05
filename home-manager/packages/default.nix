{ pkgs, ... }:

with pkgs;
let
  default-python = python3.withPackages (python-packages:
    with python-packages; [
      pip
    ]);

  nixpkgs.config.allowUnfreePredicate = true;

in {
  home.packages = with pkgs; [
    # MISC

    # TERMINAL
    any-nix-shell
    fastfetch
    zip
    unrar
    unzip
    tree
    gnupg

    # DEVELOPMENT
    openjdk
   default-python

    # SYSADMIN

    # OFFICE
     firefox

    # DEFAULT
    pavucontrol
    discord
    spotify
    blueman

    # GAMES
  ];


}
