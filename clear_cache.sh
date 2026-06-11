#!/bin/bash

# ==================================================
# Cache Cleaner
# Purpose: Close browsers, clear browser cache, reopen browsers,
# and display completion status.
# Platform: macOS
# ==================================================

echo "This script will close your browsers, clear browser cache, and reopen them."
read -p "Continue? y/n: " confirm

confirm=$(echo "$confirm" | tr '[:upper:]' '[:lower:]')

if [ "$confirm" = "y" ] || [ "$confirm" = "yes" ]; then
    echo ""
    echo "01000011 01100001 01110010 01101100 01101111 01110011"
    echo ""
else
    echo "Cancelled."
    exit 0
fi

BROWSERS=("Safari" "Google Chrome" "Firefox" "Microsoft Edge" "Brave Browser")

OPEN_BROWSERS=()

echo "Checking open browsers..."

for browser in "${BROWSERS[@]}"; do
    if pgrep -x "$browser" > /dev/null; then
        echo "$browser is open. Closing..."
        OPEN_BROWSERS+=("$browser")
        osascript -e "tell application \"$browser\" to quit"
    fi
done

# Give browsers time to close cleanly
sleep 5

echo "Clearing browser-specific cache..."

rm -rf "$HOME/Library/Caches/Google/Chrome/"* 2>/dev/null
rm -rf "$HOME/Library/Caches/com.google.Chrome/"* 2>/dev/null

rm -rf "$HOME/Library/Caches/com.apple.Safari/"* 2>/dev/null

rm -rf "$HOME/Library/Caches/Firefox/"* 2>/dev/null
rm -rf "$HOME/Library/Caches/Mozilla/"* 2>/dev/null

echo "Browser cache cleanup attempted."

echo "Reopening browsers that were previously open..."

for browser in "${OPEN_BROWSERS[@]}"; do
    echo "Opening $browser..."
    open -a "$browser"
done


osascript -e 'display notification "Cache cleared and browsers reopened." with title "Cache Cleaner Complete"'

clear
cat <<'EOF'
========================================
              CACHE CLEANER
========================================

        01000011 01100001 01110010
        01101100 01101111 01110011

              [✓] BROWSER CACHE CLEARED
              [✓] BROWSERS REOPENED

              ______________________
             |                      |
             |   CLEANUP STATUS     |
             |      SUCCESS         |
             |______________________|

========================================
EOF

echo ""
echo "Previous tabs should restore only if browser settings allow it."
echo "Chrome: enable 'Continue where you left off'."
echo "Safari: enable 'All windows from last session'."
echo ""
echo "Cache Cleaner completed successfully."
