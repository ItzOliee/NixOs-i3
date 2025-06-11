{ config, pkgs, ... }:

let
  yaziConfigPath = ".config/yazi/yazi.toml";
  yaziKeymapPath = ".config/yazi/keymap.toml";
  yaziInitLuaPath = ".config/yazi/init.lua";

  yaziPlugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "main";
    sha256 = "+V34p+obyezSL3uq8OT+LA1i3TjUKt9J4OyJus0knB0="; # Replace with actual hash
  };
in {
  home.packages = with pkgs; [
  ];

  home.file.${yaziConfigPath}.text = ''
 ########################################
  # Yazi Core Configuration
  ########################################

  home.file.${yaziConfigPath}.text = ''
    [mgr]
    show_hidden = true
    layout = "classic"
  '';

  ########################################
  # Keymap Configuration
  ########################################

  home.file.${yaziKeymapPath}.text = ''
    [[keymap.prepend]]
    on   = "T"
    run  = "plugin toggle-pane max-preview"
    desc = "Maximize or restore the preview pane"

    [[keymap.prepend]]
    on   = ["c", "m"]
    run  = "plugin chmod"
    desc = "Change permissions (chmod)"
  '';

  ########################################
  # Lua Plugin Initialization
  ########################################

  home.file.${yaziInitLuaPath}.text = ''
    require("plugins.full-border").setup()
  '';

  ########################################
  # Plugin Installation (full-border)
  ########################################

  home.file.".config/yazi/plugins/full-border/init.lua".source =
    "${yaziPlugins}/full-border.yazi/init.lua";
}
