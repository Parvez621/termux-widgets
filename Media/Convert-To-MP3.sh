#!/data/data/com.termux/files/usr/bin/bash

set -euo pipefail

source "$HOME/.config/termux-widgets/common.sh"

ensure_command ffmpeg

input="$(termux-clipboard-get 2>/dev/null || true)"

if [ -z "$input" ]; then
    toast "Copy the media file path first"
    exit 1
fi

if [ ! -f "$input" ]; then
    toast "Media file not found"
    exit 1
fi

output="${input%.*}.mp3"

if ffmpeg \
    -y \
    -i "$input" \
    -vn \
    -codec:a libmp3lame \
    -q:a 2 \
    "$output"; then

    toast "MP3 conversion complete"
    notify "Created $(basename "$output")"
else
    toast "MP3 conversion failed"
    exit 1
fi