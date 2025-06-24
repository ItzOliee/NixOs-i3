{ config, pkgs, ... }:

let
  bashrcPath = ".bashrc";
in {
  home.packages = with pkgs; [
    fish
  ];

  home.file.${bashrcPath}.text = ''
    ########################################
    # Load pywal colors
    ########################################
    if [ -f "$HOME/.cache/wal/colors.sh" ]; then
      . "$HOME/.cache/wal/colors.sh"
    fi

    ########################################
    # Interactive Shell Exec
    ########################################
    case $- in
      *i*)
        exec ${pkgs.fish}/bin/fish
        ;;
    esac

    ########################################
    # Additional bashrc content can go here
    ########################################
  '';
}
