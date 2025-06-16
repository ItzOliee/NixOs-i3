{ ... }:

{
  imports = [
    # theme
    ./pywal

    # cli

    # shell
    ./fish.nix

    # wm
    ./i3.nix
    ./picom.nix

    # term
    ./kitty.nix
    ./fish.nix
    ./bashrc.nix
    ./starship.nix   
   
   # notifications
   ./dunst.nix

    # font

    # Keyboard Input Method / 日本語入力
  ];
}
