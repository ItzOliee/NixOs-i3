{ config, pkgs, ... }:

let
  fishConfigPath = ".config/fish/config.fish";
in {
  home.packages = with pkgs; [
    eza       # ls replacement
    bat       # cat replacement
    fd        # find replacement
  ];

  programs.fish.enable = true;

  home.file.${fishConfigPath}.text = ''
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
    # Aliases
    ########################################
    alias ls="eza --icons"
    alias cat="bat"
    alias grep="grep --color=auto"
    alias find="fd"

    ########################################
    # Pywal Colors
    ########################################
    if test -f ~/.cache/wal/colors.sh
        source ~/.cache/wal/colors.sh
    end

    ########################################
    # Functions
    ########################################
    function update-system
      echo "Updating system..."
      sudo nixos-rebuild switch --flake ~/nixos#$(hostname)
    end

    function ll
      eza -l --git
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
}
