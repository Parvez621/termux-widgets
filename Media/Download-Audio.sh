#!/data/data/com.termux/files/usr/bin/bash

set -euo pipefail

source "$HOME/.config/termux-widgets/common.sh"

ensure_storage
ensure_command yt-dlp
ensure_command ffmpeg

url="$(termux-clipboard-get 2>/dev/null || true)"

if [ -z "$url" ]; then
    toast "Copy a media URL first"
    exit 1
fi

output_dir="$WIDGET_DOWNLOAD_DIR/Audio"

mkdir -p "$output_dir"

if yt-dlp \
    --no-playlist \
    -x \
    --audio-format mp3 \
    --audio-quality 0 \
    -o "$output_dir/%(title).180B [%(id)s].%(ext)s" \
    "$url"; then

    toast "Audio download complete"
    notify "Audio downloaded"
else
    toast "Audio download failed"
    exit 1
fi