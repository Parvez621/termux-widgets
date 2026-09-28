#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
source "$HOME/.config/termux-widgets/common.sh" 2>/dev/null || true

WIDGET_DOWNLOAD_DIR="${WIDGET_DOWNLOAD_DIR:-$HOME/storage/downloads/Termux-Widgets}"
mkdir -p "$WIDGET_DOWNLOAD_DIR/Audio"
command -v yt-dlp >/dev/null 2>&1 || { echo "yt-dlp is not installed."; exit 1; }
command -v ffmpeg >/dev/null 2>&1 || { echo "ffmpeg is not installed."; exit 1; }

url="$(termux-clipboard-get 2>/dev/null || true)"
[ -n "$url" ] || read -rp "Media URL: " url

yt-dlp --no-playlist -x --audio-format best \
    -o "$WIDGET_DOWNLOAD_DIR/Audio/%(title).180B [%(id)s].%(ext)s" "$url"

echo "Saved to $WIDGET_DOWNLOAD_DIR/Audio"
