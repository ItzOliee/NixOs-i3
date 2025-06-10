#!/usr/bin/env bash
set -e

PYWAL_COLORS="~/.cache/wal/colors.json"
OUTPUT_FILE="$HOME/.config/starship.toml"

if [[ ! -f "$PYWAL_COLORS" ]]; then
  echo "Pywal colors.json not found at $PYWAL_COLORS"
  exit 1
fi

color0=$(jq -r '.colors.color0' "$PYWAL_COLORS")
color1=$(jq -r '.colors.color1' "$PYWAL_COLORS")
color2=$(jq -r '.colors.color2' "$PYWAL_COLORS")
color3=$(jq -r '.colors.color3' "$PYWAL_COLORS")
color4=$(jq -r '.colors.color4' "$PYWAL_COLORS")
color5=$(jq -r '.colors.color5' "$PYWAL_COLORS")
color6=$(jq -r '.colors.color6' "$PYWAL_COLORS")
color7=$(jq -r '.colors.color7' "$PYWAL_COLORS")

cat > "$OUTPUT_FILE" <<EOF
########################################
# Starship Prompt Configuration - generated from pywal
########################################

format = """
[░▒▓](#${color0})\
\$os\
\$username\
[](bg:#${color1} fg:#${color0})\
\$directory\
[](fg:#${color1} bg:#${color2})\
\$git_branch\
\$git_status\
[](fg:#${color2} bg:#${color3})\
\$c\
\$python\
\$elixir\
\$elm\
\$golang\
\$haskell\
\$java\
\$julia\
\$nodejs\
\$nim\
\$rust\
\$scala\
[](fg:#${color3} bg:#${color4})\
\$docker_context\
[](fg:#${color4} bg:#${color5})\
\$time\
[ ](fg:#${color5})\
\n
\$cmd_duration\
\$character\
"""

[line_break]
disabled = false

[username]
show_always = true
style_user = "bg:#${color0}"
style_root = "bg:#${color5}"
format = '[ \$user ](\$style)'
disabled = false

[os]
style = "bg:#${color5}"
disabled = true # Disabled by default

[directory]
style = "bg:#${color1}"
format = "[ \$path ](\$style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = " "
"Downloads" = " "
"Music" = " "
"Pictures" = " "

[c]
symbol = " "
style = "bg:#${color3}"
format = '[ \$symbol (\$version) ](\$style)'

[python]
symbol = " "
style = "bg:#${color3}"
format = '[ \$symbol (\$version) ](\$style)'

[docker_context]
symbol = " "
style = "bg:#${color4}"
format = '[ \$symbol \$context ](\$style) \$path'

[elixir]
symbol = " "
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[elm]
symbol = " "
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[git_branch]
symbol = ""
style = "bg:#${color2}"
format = '[ \$symbol \$branch ](\$style)'

[git_status]
style = "bg:#${color2}"
format = '[\$all_status\$ahead_behind ](\$style)'

[golang]
symbol = " "
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[haskell]
symbol = " "
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[java]
symbol = " "
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[julia]
symbol = " "
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[nodejs]
symbol = ""
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[nim]
symbol = " "
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[rust]
symbol = ""
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[scala]
symbol = " "
style = "bg:#${color2}"
format = '[ \$symbol (\$version) ](\$style)'

[time]
disabled = false
time_format = "%R"
style = "bg:#${color5}"
format = '[  \$time ](\$style)'

[character]
success_symbol = '[ ➜](#${color5})'
error_symbol = '[ ➜](bold red)'

[cmd_duration]
min_time = 500
format = ' [\$duration](#${color5})'
EOF

echo "Starship config generated at $OUTPUT_FILE"

