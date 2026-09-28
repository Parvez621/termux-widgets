#!/data/data/com.termux/files/usr/bin/bash

set -euo pipefail

source "$HOME/.config/termux-widgets/common.sh"

ensure_storage
ensure_command yt-dlp

url="$(termux-clipboard-get 2>/dev/null || true)"

if [ -z "$url" ]; then
    toast "Copy an Instagram Reel URL first"
    exit 1
fi

if [[ ! "$url" =~ ^https://(www\.)?instagram\.com/reel/[^/?#]+ ]]; then
    toast "Clipboard is not an Instagram Reel URL"
    exit 1
fi

output_dir="$WIDGET_DOWNLOAD_DIR/Instagram-Reels"

mkdir -p "$output_dir"

args=(
    --no-playlist
    -f 'bv*+ba/b'
    --merge-output-format mp4
    -o "$output_dir/%(uploader)s - %(title).120B [%(id)s].%(ext)s"
)

cookies="$HOME/.config/termux-widgets/instagram-cookies.txt"

if [ -f "$cookies" ]; then
    args+=(--cookies "$cookies")
fi

if yt-dlp "${args[@]}" "$url"; then
    toast "Instagram Reel downloaded"
    notify "Instagram Reel downloaded"
else
    toast "Instagram Reel download failed"
    exit 1
fi