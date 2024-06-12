#!/bin/bash

# Directory for icons
iDIR="$HOME/.config/swaync/icons"

# Note: You can add more options below with the following format:
# ["TITLE"]="link"

# Define menu options as an associative array
declare -A menu_options=(
  ["Thanatos Live 📻🎶🎻🎶☕️🎶"]="https://www.youtube.com/watch?v=8Jax4Ol2I7Y"
  ["Thanatos 📻🎶🎻🎶☕️🎶"]="https://www.youtube.com/watch?v=0QKQlf8r7ls&list=UULPmYTgpKxd-QOJCPDrmaXuqQ"
  ["Thanatos 2 📻🎶🎻🎶☕️🎶"]="https://www.youtube.com/watch?v=qk1nnAHI1mI"
  ["Thanatos 3 📻🎶🎻🎶☕️🎶"]="https://www.youtube.com/watch?v=LxQWv-p5BMQ"
  ["Thanatos Elysium 📻🎶🎻🎶☕️🎶"]="https://www.youtube.com/watch?v=yKS3R5Kf4Pk"
  ["Gandalf ☕️🎶"]="https://www.youtube.com/watch?v=Sagg08DrO5U"
)

# Function for displaying notifications
notification() {
  notify-send -u normal -i "$iDIR/music.png" "Playing now: $@"
}

# Main function
main() {
  choice=$(printf "%s\n" "${!menu_options[@]}" | rofi -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -i -p "")

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${menu_options[$choice]}"

  notification "$choice"

  # Check if the link is a playlist
  if [[ $link == *playlist* ]]; then
    mpv --shuffle --vid=no "$link"
  else
    mpv "$link"
  fi
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$iDIR/music.png" "Online Music stopped" || main
