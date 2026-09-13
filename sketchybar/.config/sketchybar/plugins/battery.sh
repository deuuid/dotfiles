#!/bin/bash
set -e

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power' || true)"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

ICONS_DISCHARGING=(󰂎 󰁺 󰁻 󰁼 󰁽 󰁾 󰁿 󰂀 󰂁 󰂂 󰁹)
ICONS_CHARGING=(󰂄 󰢜 󰂆 󰂇 󰂈 󰢝 󰂉 󰢞 󰂊 󰂋 󰂅)

INDEX=$((PERCENTAGE / 10))

if [ "$CHARGING" != "" ]; then
  ICON="${ICONS_CHARGING[$INDEX]}"
else
  ICON="${ICONS_DISCHARGING[$INDEX]}"
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
