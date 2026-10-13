#!/bin/bash
# Bound to Ctrl + Shift + space
# one menu for all dmenu thingies
# also means you can get to dmenu one handed since ctrl + shift + enter is too far away for my feeble femme hands

# Define the list of items and their prefixes (folder name)
declare -A SCRIPTS
SCRIPTS=(
  ["Screen Recording Menu"]="$HOME/Scripts/record.sh"
  ["Song Menu"]="$HOME/Scripts/setSong.sh"
  ["Playlist Menu"]="$HOME/Scripts/setPlaylist.sh"
  ["Power Options Menu"]="$HOME/Scripts/powerBind.sh"
  ["Wallpaper Menu"]="$HOME/Scripts/wallBind.sh"
  ["Steam Menu"]="$HOME/Scripts/steamMenu.sh"
  ["Open dmenu"]="dmenu_run"
)

ORDER=(
  "Power Options Menu"
  "Open dmenu"
  "Steam Menu"
  "Song Menu"
  "Playlist Menu"
  "Screen Recording Menu"
  "Wallpaper Menu"
)

DMENU_INPUT=""

for NAME in "${ORDER[@]}"; do
  DMENU_INPUT+="$NAME\n"
done

DMENU_INPUT=$(echo -e "$DMENU_INPUT" | sed '/^$/d')

SELECTED_ITEM=$(echo -e "$DMENU_INPUT" | dmenu -l 10 -i -p "Pick a Script:")

if [[ -n "$SELECTED_ITEM" ]]; then
    "${SCRIPTS[$SELECTED_ITEM]}"
fi
