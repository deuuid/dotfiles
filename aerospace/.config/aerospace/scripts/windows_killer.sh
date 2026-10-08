#!/bin/bash
set -e

BAR_INFO=$(sketchybar --query bar)
[[ "$BAR_INFO" =~ \"height\":[[:space:]]*([0-9]+) ]]
BH="${BASH_REMATCH[1]}"

# Anchor the popover under the window-count item in sketchybar.
S='[[:space:]]*'
N='([0-9.]+)'
ITEM_INFO=$(sketchybar --query windows)
if [[ "$ITEM_INFO" =~ \"origin\":$S\[$S$N,$S$N$S\]$S,$S\"size\":$S\[$S$N,$S$N ]]; then
  X="${BASH_REMATCH[1]}"
  Y="${BASH_REMATCH[2]}"
  W="${BASH_REMATCH[3]}"
  H="${BASH_REMATCH[4]}"
else
  X=9999 Y=0 W=0 H="$BH"
fi

open -g "sketchybarwk://toggle?x=${X}&y=${Y}&w=${W}&h=${H}"
