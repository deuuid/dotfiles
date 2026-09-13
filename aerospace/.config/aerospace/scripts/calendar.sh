#!/bin/bash
set -e

BAR_INFO=$(sketchybar --query bar)
[[ "$BAR_INFO" =~ \"height\":[[:space:]]*([0-9]+) ]]
BH="${BASH_REMATCH[1]}"

open -g "sketchybarcal://toggle?bh=${BH}"
