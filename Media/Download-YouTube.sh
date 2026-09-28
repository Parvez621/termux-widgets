#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
source "$(cd "$(dirname "$0")/../lib" 2>/dev/null && pwd)/common.sh" 2>/dev/null || source "$HOME/.config/termux-widgets/common.sh" 2>/dev/null || true

ensure_storage
ensure_command yt-dlp

url="$(termux-clipboard-get 2>/dev/null || true)"
if [ -z "$url" ]; then
    read -rp "YouTube URL: " url
fi

case "$url" in
    https://www.youtube.com/*|https://youtube.com/*|https://youtu.be/*|https://m.youtube.com/*) ;;
    *) echo "Not a recognized YouTube URL."; toast "Invalid YouTube URL"; exit 1;;
esac

mkdir -p "$WIDGET_DOWNLOAD_DIR/YouTube"
yt-dlp --no-playlist -f 'bv*+ba/b' --merge-output-format mp4 \
    -o "$WIDGET_DOWNLOAD_DIR/YouTube/%(title).180B [%(id)s].%(ext)s" "$url"

toast "YouTube download completed"
echo "Saved to $WIDGET_DOWNLOAD_DIR/YouTube"
