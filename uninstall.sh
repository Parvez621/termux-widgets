#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

SHORTCUTS="$HOME/.shortcuts"
for category in Media System Development Android; do
    rm -f "$SHORTCUTS/$category"/*.sh 2>/dev/null || true
done

rmdir "$SHORTCUTS/Media" "$SHORTCUTS/System" "$SHORTCUTS/Development" "$SHORTCUTS/Android" 2>/dev/null || true

echo "Termux Widgets scripts removed. Downloaded files were left untouched."
