#!/bin/bash
set -e

BAR_INFO=$(sketchybar --query bar)
[[ "$BAR_INFO" =~ \"height\":[[:space:]]*([0-9]+) ]]
BH="${BASH_REMATCH[1]}"

open "sketchybartodo://toggle?x=9999&y=0&w=0&h=${BH}"
