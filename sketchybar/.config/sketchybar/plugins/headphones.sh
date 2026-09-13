#!/bin/bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DIR/colors.sh"

CONNECTED=0
IN_CONNECTED=0
while IFS= read -r line; do
  case "$line" in
    *'"device_connected"'*) IN_CONNECTED=1 ;;
    *'"device_not_connected"'*) IN_CONNECTED=0 ;;
    *'"device_minorType"'*)
      if [ "$IN_CONNECTED" = "1" ] && [[ "$line" == *"Headphones"* || "$line" == *"Headset"* ]]; then
        CONNECTED=1
      fi
      ;;
  esac
done < <(system_profiler SPBluetoothDataType -json 2>/dev/null)

if [ "$CONNECTED" = "1" ]; then
  sketchybar --set "$NAME" icon.color=$ACTIVE
else
  sketchybar --set "$NAME" icon.color=$INACTIVE
fi
