{ config, pkgs, ... }:

let
  kittyConfigPath = ".config/kitty/kitty.conf";
  fishPath = "${pkgs.fish}/bin/fish";
in {
  home.packages = with pkgs; [
  ];

  home.file.${kittyConfigPath}.text = ''
    ########################################
    # Visual
    ########################################
    include ~/.cache/wal/colors-kitty.conf

    background_opacity 0.1
    window_padding_width 5
    window_margin_width 5
    window_border_width 2px


    #######################################
    # Shell
    #######################################

    shell: ${fishPath}

    ########################################
    # Font Settings
    ########################################
    font_family      FiraCode Nerd Font
    bold_font        auto
    italic_font      auto
    font_size        11.0

    ########################################
    # Cursor
    ########################################
    cursor_shape     block
    cursor_blink     on

    ########################################
    # Window Behavior
    ########################################
    confirm_os_window_close 0
    enabled_layouts         tall
    remember_window_size    yes

    ########################################
    # Scrolling
    ########################################
    scrollback_lines 10000

    ########################################
    # Key Bindings
    ########################################
    map ctrl+shift+c copy_to_clipboard
    map ctrl+shift+v paste_from_clipboard

    ########################################
    # Mouse Behavior
    ########################################
    mouse_hide_wait 3.0

    ########################################
    # Bell
    ########################################
    enable_audio_bell no
    visual_bell_duration 0.1
  '';
}
