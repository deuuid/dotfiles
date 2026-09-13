#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/colors.sh"

if pgrep -x "sing-box" >/dev/null 2>&1; then
  sketchybar --set xray label.color=$ACTIVE
else
  sketchybar --set xray label.color=$INACTIVE
fi
