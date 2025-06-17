{ config, pkgs, ... }:

let
  rofiConfigPath = ".config/rofi/config.rasi";
in {
  home.packages = with pkgs; [
  ];


  home.file.${rofiConfigPath}.text = ''



@theme: "~/.cache/wal/colors-rofi-dark.rasi"; // Path to theme file


configuration {
    modi: "drun,run,window";     // Modes to use
    show-icons: true;            // Show icons next to entries
    icon-theme: "Papirus";       // Set icon theme (depends on system)
    font: "JetBrains Mono 10";   // Font for rofi
    lines: 10;                   // Number of lines to show
    columns: 1;                  // Number of columns
    width: 50;                   // Width in percent
    sidebar-mode: false;         // Enable sidebar mode
    disable-history: false;      // Keep command history
    matching: "fuzzy";           // Matching algorithm: normal, fuzzy, regex, glob
    case-sensitive: false;       // Ignore case when searching
    sort: true;                  // Sort matches
    cycle: true;                 // Loop through list entries
    fixed-num-lines: true;       // Always show the number of lines defined
    terminal: "alacritty";       // Terminal used in run mode
    ssh-client: "ssh";           // SSH client command
    dpi: 0;                      // DPI override (0 = auto)

  '';
}



