#!/data/data/com.termux/files/usr/bin/bash

set -euo pipefail

source "$HOME/.config/termux-widgets/common.sh"

ensure_storage
ensure_command yt-dlp

url="$(termux-clipboard-get 2>/dev/null || true)"

if [ -z "$url" ]; then
    toast "Copy a YouTube URL first"
    exit 1
fi

case "$url" in
    https://www.youtube.com/*|\
    https://youtube.com/*|\
    https://youtu.be/*|\
    https://m.youtube.com/*)
        ;;
    *)
        toast "Clipboard does not contain a YouTube URL"
        exit 1
        ;;
esac

output_dir="$WIDGET_DOWNLOAD_DIR/YouTube"

mkdir -p "$output_dir"

if yt-dlp \
    --no-playlist \
    -f 'bv*+ba/b' \
    --merge-output-format mp4 \
    -o "$output_dir/%(title).180B [%(id)s].%(ext)s" \
    "$url"; then

    toast "YouTube download complete"
    notify "YouTube video downloaded"
else
    toast "YouTube download failed"
    exit 1
fi