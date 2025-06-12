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

    # term
    ./kitty.nix
    ./fish.nix
    ./bashrc.nix
    ./starship.nix   

    # dev


    # font

    # Keyboard Input Method / 日本語入力
  ];
}
