#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/colors.sh"

if pgrep -xq "AmneziaVPN"; then
  sketchybar --set "$NAME" icon.color=$MAIN
else
  sketchybar --set "$NAME" icon.color=$INACTIVE
fi
