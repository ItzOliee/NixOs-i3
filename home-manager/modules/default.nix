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
    ./rofi.nix
    ./Polybar/polybar.nix   

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
