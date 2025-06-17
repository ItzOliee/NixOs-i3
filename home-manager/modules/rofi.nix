{ config, pkgs, ... }:

let
  rofiConfigPath = ".config/rofi/config.rasi";
in {
  home.packages = with pkgs; [
  ];

  # Import Pywal's rofi colors
  home.file.".config/rofi/colors.rasi".source =
    "${config.home.homeDirectory}/.cache/wal/colors.json";

  home.file.${rofiConfigPath}.text = ''
    @import "colors.rasi"

    * {
      font: "Figtree 13";
      spacing: 10px;
      margin: 0;
      padding: 8px;
      border-radius: 8px;
    }

    configuration {
      modi: "drun";
      show-icons: true;
      display-drun: "";
    }

    listview {
      columns: 1;
      lines: 7;
      fixed-height: true;
      fixed-columns: true;
      cycle: false;
      scrollbar: false;
      border: 0px solid;
    }

    window {
      transparency: "real";
      width: 450px;
      border-radius: 8px;
      background-color: @background;
      border: 2px solid;
      border-color: @color4;
      padding: 12px;
    }

    prompt {
      text-color: @foreground;
    }

    inputbar {
      children: ["prompt", "entry"];
      spacing: 10px;
    }

    entry {
      placeholder: "Search Apps";
      text-color: @foreground;
      placeholder-color: @color8;
    }

    mainbox {
      spacing: 10px;
      margin: 0;
      padding: 8px;
      children: ["inputbar", "listview", "message"];
    }

    element {
      spacing: 10px;
      margin: 0;
      padding: 8px;
      border: 0px solid;
      border-radius: 8px;
      border-color: @color0;
      background-color: transparent;
      text-color: @foreground;
    }

    element normal.normal {
      background-color: transparent;
      text-color: @foreground;
    }

    element alternate.normal {
      background-color: @color1;
      text-color: @foreground;
    }

    element selected.active,
    element selected.normal {
      background-color: @color4;
      text-color: @background;
    }

    message {
      background-color: @color1;
      border: 0px solid;
    }
  '';
}
