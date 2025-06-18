{ config, pkgs, ... }:

let
  rofiConfigPath = ".config/rofi/config.rasi";
  rofiThemePath = ".cache/wal/colors-rofi-dark.rasi";
in {
  home.packages = with pkgs; [
    # Add necessary packages like rofi here
  ];

  home.file."${rofiConfigPath}".text = ''
    @theme "~/${rofiThemePath}"
              

* {
    font: "Figtree 13";
    g-spacing: 10px;
    g-margin: 0;
    b-radius: 8px;
    g-padding: 8px;
    wbg-color: #00000033; /* Fully transparent */
    w-border: 2px solid; /* Cyan border */
    w-border-color: #00FFFF; /* Cyan color */   
    w-padding: 12px;
     hl-color: #FFFFFFFF;
    hlt-color: #000000FF;
    alt-color: #111111FF;
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
    border-radius: @b-radius;
    background-color: @background;
    border: @w-border;
    border-color: @foreground;
    padding: @w-padding;
}

prompt {
    text-color: @foreground;
}

inputbar {
    children: ["prompt", "entry"];
    spacing: @g-spacing;
}

entry {
    placeholder: "Search Apps";
    text-color: @foreground;
    placeholder-color: @background;
}

mainbox {
    spacing: @g-spacing;
    margin: @g-margin;
    padding: @g-padding;
    children: ["inputbar", "listview", "message"];
}

element {
    spacing: @g-spacing;
    margin: @g-margin;
    padding: @g-padding;
    border: 0px solid;
    border-radius: @b-radius;
    border-color: @background;
    background-color: transparent;
    text-color: @foreground;
}

element normal.normal {
	background-color: transparent;
	text-color: @foreground;
}

element alternate.normal {
	background-color: @background;
	text-color: @foreground;
}

element selected.active {
	background-color: @background;
	text-color: @foreground;
}

element selected.normal {
	background-color: @background;
	text-color: @foreground;
}

message {
    background-color: red;
    border: 0px solid;
}

  '';
  }
