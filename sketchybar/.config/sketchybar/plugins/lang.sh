#!/bin/bash
set -e

SOURCE_ID=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID 2>/dev/null || true)
LAYOUT="${SOURCE_ID##*.}"

case "$LAYOUT" in
  US) LABEL="EN" ;;
  RussianWin|Russian) LABEL="RU" ;;
  *) LABEL=$(echo "$LAYOUT" | tr '[:lower:]' '[:upper:]' | cut -c1-2) ;;
esac

sketchybar --set "$NAME" label="$LABEL"
