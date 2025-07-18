{ config, pkgs, ... }:

let
  starshipConfigPath = ".config/starship.toml";
in {
  home.packages = with pkgs; [
  ];

  home.file.${starshipConfigPath}.text = ''
    ########################################
    # Starship Prompt Configuration
    ########################################

format = """
[╭─](color2)\
    [【](color7)\
      $username\
      [@](color7)\
      $hostname \
      $directory\      
    [】](color7)
[│](color2)\
    $git_branch\
    $git_status\
    $package\
    $python\
    $nodejs\    
    $custom
[╰─](color2)\
    $memory_usage\
    $time\
    $cmd_duration\    
    $shell"""

palette = "pywal"
[palettes.pywal]
color0="#0D0C0B"
color1="#656555"
color2="#5B5E61"
color3="#5E6265"
color4="#67696B"
color5="#BA593C"
color6="#907566"
color7="#cebdac"
color8="#908478"


[memory_usage]
disabled = false
symbol = ""
threshold = -1
format = " [$symbol$ram](color1)"


[username]
show_always = true
format = "[$user](color1)"

[hostname]
ssh_only= false
format = "[$hostname](color1)"
disabled = false

[custom.docker]
command = "echo '  '"
files = ["Dockerfile", 'docker-compose.yml', "docker-compose.yaml"]
when = """ comand -v docker &> /dev/null; exit (echo $?); """
format = " [$output](color7)"

[character]
success_symbol = " [$shell\\$](color7)"
error_symbol = " [$shell✖](color7)"

[shell]
powershell_indicator = "_"
bash_indicator = ""
disabled= false

[time]
disabled = false
time_format = "%T"
format = "[ $time](color5)"
use_12hr = true

[directory]
disabled = false
read_only = " "
truncation_length = 4
truncate_to_repo = false
format = "[$read_only](color4)[$path](color4) "
home_symbol = ""

# [directory.substitution]
# "~" = ""

[cmd_duration]
disabled = false
min_time = 2000
show_milliseconds = true
show_notifications = false
min_time_to_notify = 45_000
format = "[ 祥$duration](color3) "


[git_branch]
symbol = " "
format = "[$symbol$branch](color7)"

[package]
symbol =" "
display_private = true
format = "[$symbol$version](color4)"

#=== languages ===

[nodejs]
symbol = "  "
format = "[$symbol($version)](color7)"

[python]
symbol = "  "
pyenv_prefix = 'pyenv '
python_binary = "python"
format = '[$symbol$pyenv_prefix$version(\($virtualenv\))](color7)'



  '';
}
