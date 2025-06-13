{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    eza       # ls replacement
    bat       # cat replacement
    fd        # find replacement
  ];

  programs.fish = {
    enable = true;

    shellInit = ''


      ########################################
      # Disable Fish Greeting
      ########################################
      set fish_greeting

      ########################################
      # Environment Variables
      ########################################
      set -gx EDITOR nvim
      set -gx VISUAL nvim
      set -gx PAGER less
      set -gx BROWSER firefox

      ########################################
      # Prompt (using starship)
      ########################################
      starship init fish | source

      ########################################
      # Pywal Colors
      ########################################
      if test -e ~/.cache/wal/colors.fish
          source ~/.cache/wal/colors.fish
      end

      ########################################
      # Startup Commands
      ########################################
      fish_vi_key_bindings

      ########################################
      # PATH Fixes
      ########################################
      set -U fish_user_paths $HOME/.local/bin $fish_user_paths
    '';

    shellAliases = {
      ls = "eza --icons";
      cat = "bat";
      grep = "grep --color=auto";
      find = "fd";
      hsm = "home-manager switch";
    };

    functions = {
      update-system.body = ''
        echo "Updating system..."
        sudo nixos-rebuild switch --flake ~/nixos#(hostname)
      '';

      ll.body = ''
        eza -l --git
      '';
    };
  };
}
