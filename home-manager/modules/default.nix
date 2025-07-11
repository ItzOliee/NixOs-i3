{ ... }:

{
  imports = [
    # theme
    ./pywal
    ./themecord.nix

    # cli

    # shell
    ./fish.nix

    # wm
    ./i3.nix
    ./picom.nix
    ./rofi_launcher.nix
    ./Polybar/polybar.nix   
    ./firefox.nix
    ./pywalfox.nix
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
