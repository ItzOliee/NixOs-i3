{ config, pkgs, ... }:

let
  bashrcPath = ".bashrc";
in {
  home.packages = with pkgs; [
    fish
  ];

  home.file.${bashrcPath}.text = ''
    ########################################
    # Interactive Shell Exec
    ########################################
    # If the shell is interactive, replace bash with fish shell
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
