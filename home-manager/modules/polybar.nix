{ config, pkgs, ... }:

let
  polybarConfigPath = ".config/polybar/config.ini";
in {
  home.packages = with pkgs; [
  ];


  home.file.${polybarConfigPath}.text = ''

[colors]
background = ${xrdb:background}
background-alt = ${xrdb:background}
foreground = ${xrdb:foreground}

red = ${xrdb:color1}
green = ${xrdb:color2}
yellow = ${xrdb:color3}
blue = ${xrdb:color4}
magenta = ${xrdb:color5}
cyan = ${xrdb:color6}
white = ${xrdb:color7}
gray = ${xrdb:color8}



alert = ${xrdb:color1}
;red

disabled = #707880

;[global/wm]
;margin-bottom = -10pt

[bar/main]
monitor = ${env:MONITOR}

width = 100%
height = 22pt
radius = 10

; dpi = 96

background = ${colors.background}
foreground = ${colors.foreground}

line-size = 3pt

border-size = 5pt
border-color = #00000000

padding-left = 1
padding-right = 2

module-margin = 1

separator = |
separator-foreground = ${colors.disabled}

font-0 = "JetBrainsMono:size=10:style=Medium;0"
font-1 = "Twemoji:scale=6:style=Regular;0"
font-2 = "Hack Nerd Font Mono:pixelsize=10;3"

modules-left = i3 xwindow
modules-right = pulseaudio backlight date battery

cursor-click = pointer
cursor-scroll = ns-resize

enable-ipc = true

tray-position = right

; wm-restack = generic
; wm-restack = bspwm
wm-restack = i3
override-redirect = false

bottom = true
 
[module/xworkspaces]
type = internal/xworkspaces

icon-0 = 10;

label-active = %name%
label-active-foreground = ${colors.background}
label-active-background = ${colors.primary}
;label-active-underline= ${colors.primary}
label-active-padding = 1

label-occupied = %name%
label-occupied-padding = 1

label-urgent = %name%
label-urgent-background = ${colors.alert}
label-urgent-padding = 1

label-empty = %name%
label-empty-foreground = ${colors.disabled}
label-empty-padding = 1

[module/i3]
type = internal/i3

pin-workspaces = true

label-mode = %mode%
label-mode-padding = 2
label-mode-background = ${colors.red}

; Available tokens:
;   %name%
;   %icon%
;   %index%
;   %output%
; Default: %icon% %name%
label-focused = %index%
label-focused-foreground = ${colors.background}
label-focused-background = ${colors.primary}
label-focused-padding = 1

; Available tokens:
;   %name%
;   %icon%
;   %index%
;   %output%
; Default: %icon% %name%
label-unfocused = %index%
label-unfocused-foreground = ${colors.foreground}
label-unfocused-padding = 1

; Available tokens:
;   %name%
;   %icon%
;   %index%
;   %output%
; Default: %icon% %name%
label-visible = %index%
label-visible-foreground = ${colors.foreground}
label-visible-padding = 1

; Available tokens:
;   %name%
;   %icon%
;   %index%
;   %output%
; Default: %icon% %name%
label-urgent = %index%
label-urgent-foreground = ${colors.background}
label-urgent-background = ${colors.red}
label-urgent-padding = 1

[module/xwindow]
type = internal/xwindow
label = %title:0:60:...%

[module/pulseaudio]
type = internal/pulseaudio

label-muted = 🔇 muted

ramp-volume-0 = 🔈
ramp-volume-1 = 🔉
ramp-volume-2 = 🔊

format-volume-prefix-foreground = ${colors.primary}
format-volume = <ramp-volume> <label-volume>

label-volume = %percentage%%

click-right = pavucontrol

label-muted-foreground = ${colors.disabled}

[module/backlight]
type = internal/backlight

card = intel_backlight

use-actual-brightness = true

format = <ramp> <label>
label = %percentage%%

enable-scroll = true

ramp-0 = 🌑
ramp-1 = 🌒
ramp-2 = 🌓
ramp-3 = 🌔
ramp-4 = 🌕



[module/battery]
type = internal/battery

full-at = 98

low-at = 15

battery = BAT0
adapter = ADP0

poll-interval = 5

time-format = %H:%M

format-charging = ⚡<ramp-capacity> <label-charging>
format-charging-foreground = ${colors.green}
label-charging = %percentage%%

format-discharging = <ramp-capacity> <label-low>
format-discharging-foreground = ${colors.yellow}

label-discharging = %percentage%%

format-full = <ramp-capacity> <label-full>
format-full-foreground = ${colors.primary}
label-full = %percentage%%

format-low =  <label-low>
format-low-foreground = ${colors.red}
label-low = %percentage%%

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 


[module/date]
type = internal/date
interval = 1


date = %d/%m %H:%M
date-alt = %d/%m/%Y %H:%M:%S

label = %date%
label-foreground = ${colors.foreground}

click-right = gsimplecal

[settings]
screenchange-reload = true
pseudo-transparency = true

; vim:ft=dosini

  '';




}

