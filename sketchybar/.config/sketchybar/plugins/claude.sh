#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/colors.sh"

if ps -eo comm= | grep -qx "claude"; then
  sketchybar --set "$NAME" icon.color=$ACTIVE
else
  sketchybar --set "$NAME" icon.color=$INACTIVE
fi
