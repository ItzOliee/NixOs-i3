{ config, pkgs, ... }:

let
  rofiConfigPath = ".config/rofi/config.rasi";
  rofiDefaultPath = ".config/rofi/themes/default.rasi";
  rofiThemePath = ".config/rofi/themes/nova.rasi";
in {
  home.packages = with pkgs; [
    # Add necessary packages like rofi here
  ];

  home.file."${rofiConfigPath}".text = ''
  @theme "~/.config/rofi/themes/nova.rasi"

'';

   home.file."${rofiDefaultPath}".text = ''
   @import "~/.cache/wal/colors-rofi-dark.rasi"

* {
    background-alt:              @selected-active-background; // Buttons background
    selected:                    @selected-normal-background; // Button selected
    active:                      @selected-urgent-background; // Window activated
    urgent:                      @selected-normal-background; // When hovering the activated window (maybe more?)

    text-selected:               @background;
    text:                        @foreground;

    shade-shadow:                white / 6%;
    shade-bg:                    white / 12%;
    shade-border:                white / 24%;
}

window {
    fullscreen:                  false;
    transparency:                "real";
    cursor:                      "default";
    background-color:            black / 12%;
    border:                      0px;
    border-color:                @selected;
}

/* Elements ----------------------------------------------------- */
element normal.normal,
element alternate.normal {
    background-color:            transparent;
    text-color:                  @text;
}

element selected.normal {
    background-color:            @shade-bg;
    text-color:                  white;
    border:                      1px solid;
    border-color:                @selected;
}

element-text {
    background-color:            transparent;
    text-color:                  inherit;
    highlight:                   inherit;
    cursor:                      inherit;
    vertical-align:              0.5;
    horizontal-align:            0.5;
}

/* Listview ---------------------------------------------------- */

listview {
  border:                        0px;
}

/* Scrollbar ---------------------------------------------------- */
scrollbar {
    margin:                      0px 4px;
    handle-width:                8px;
    handle-color:                white;
    background-color:            @shade-shadow;
    border-radius:               4px;
}

/* Message ------------------------------------------------------ */
message {
    background-color:            @shade-bg;
    border:                      1px solid;
    border-color:                transparent;
    border-radius:               12px;
    padding:                     24px;
}
error-message {
    padding:                     100px;
    border:                      0px solid;
    border-radius:               0px;
    background-color:            black / 10%;
    text-color:                  @text;
}
textbox {
    background-color:            transparent;
    text-color:                  @text;
    vertical-align:              0.5;
    horizontal-align:            0.5;
    highlight:                   none;
}

'';


  home.file."${rofiThemePath}".text = ''
 
  /* config - Launcher */

configuration {
	modi:                         "drun";
    show-icons:                 true;
    display-calc:               " ";
    display-drun:               " ";
  	drun-display-format:        "{name}";
    font:                        "JetBrains Mono Nerd Font 12";
}

/* Config and colors ----------------------------------------------- */

@import "default.rasi"

/* Main Window ------------------------------------------------ */
window {
    width:                       100%;
    height:                      100%;
    margin:                      0px;
    padding:                     0px;
}

/* Main Box --------------------------------------------------- */
mainbox {

    children:                    [ "inputbar", "message", "listview", "mode-switcher" ];
    background-color:            transparent;

    spacing:                     24px;
    margin:                      0px;
    padding:                     100px 226px;
}

/* Inputbar --------------------------------------------------- */
inputbar {
    children:                    [ "prompt", "entry" ];

    border-radius:               12px;
    background-color:            @shade-bg;
    text-color:                  @text;

    spacing:                     12px;
    margin:                      0% 28%;
    padding:                     14px;
}

prompt {
    background-color:            transparent;
    text-color:                  inherit;
}

textbox-prompt-colon {
    expand:                      false;
    str:                         "::";
    background-color:            transparent;
    text-color:                  inherit;
}

/* Entry input ------------------------------------------------ */
entry {
    background-color:            transparent;
    text-color:                  inherit;
    cursor:                      inherit;
    placeholder:                 " ";
    placeholder-color:           inherit;
}

/* Listview --------------------------------------------------- */
listview {
    cursor:                      "default";
    columns:                     6;
    lines:                       4;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   false;
    layout:                      vertical;
    reverse:                     false;
    fixed-height:                true;
    fixed-columns:               true;
    
    background-color:            transparent;
    text-color:                  @text;

    spacing:                     0px;
    margin:                      0px;
    padding:                     0px;
}

/* ---- Mode Switcher ---- */
mode-switcher{
    background-color:            transparent;
    border:                      0px;

    margin: 0px;
    padding: 0px;
    spacing: 12px;
}
button {
    padding:                     12px 0px;
    border-radius:               12px;
    background-color:            @shade-shadow;
    text-color:                  @text;
    cursor:                      pointer;
}
button selected {
    background-color:            @shade-bg;
    border:                      1px solid;
    border-color:                @selected;
    text-color:                  white;
}

/* Elements --------------------------------------------------- */
element {
    cursor:                      pointer;
    border-radius:               24px;
    background-color:            transparent;
    text-color:                  @text;
    orientation:                 vertical;

    spacing:                     16px;
    margin:                      0px;
    padding:                     36px 0px;
}

element-icon {
    background-color:            transparent;
    text-color:                  inherit;
    size:                        72px;
    cursor:                      inherit;
}

'';
}
