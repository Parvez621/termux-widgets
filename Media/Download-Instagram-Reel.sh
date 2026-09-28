#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

# Termux:Widget-compatible Instagram Reel downloader.
# Uses clipboard first, then falls back to terminal input.

WIDGET_DOWNLOAD_DIR="$HOME/storage/downloads/Termux-Widgets"
COOKIES_FILE="$HOME/.config/termux-widgets/instagram-cookies.txt"

command -v yt-dlp >/dev/null 2>&1 || {
    echo "yt-dlp is not installed. Run ./install.sh"
    exit 1
}

if [ ! -d "$HOME/storage/downloads" ]; then
    echo "Run termux-setup-storage first."
    exit 1
fi

mkdir -p "$WIDGET_DOWNLOAD_DIR/Instagram-Reels"

url="$(termux-clipboard-get 2>/dev/null || true)"
if [ -z "$url" ]; then
    read -rp "Instagram Reel URL: " url
fi

# Accept only Instagram Reel URLs. This keeps accidental clipboard contents
# from being handed to yt-dlp.
if [[ ! "$url" =~ ^https://(www\.)?instagram\.com/reel/[^/?#]+ ]]; then
    echo "Invalid Instagram Reel URL."
    echo "Example: https://www.instagram.com/reel/ABC123/"
    if command -v termux-toast >/dev/null 2>&1; then termux-toast "Invalid Instagram Reel URL" || true; fi
    exit 1
fi

args=(--no-playlist -f 'bv*+ba/b' --merge-output-format mp4 \
    -o "$WIDGET_DOWNLOAD_DIR/Instagram-Reels/%(uploader)s - %(title).120B [%(id)s].%(ext)s")

if [ -f "$COOKIES_FILE" ]; then
    args+=(--cookies "$COOKIES_FILE")
fi

echo "Downloading Reel..."
if yt-dlp "${args[@]}" "$url"; then
    echo "Saved to $WIDGET_DOWNLOAD_DIR/Instagram-Reels"
    if command -v termux-toast >/dev/null 2>&1; then termux-toast "Instagram Reel downloaded" || true; fi
else
    status=$?
    echo
    echo "Download failed. The Reel may require login, may be unavailable, or Instagram may have changed its API."
    echo "If the content is accessible to your account, configure:"
    echo "  $COOKIES_FILE"
    echo "Then update yt-dlp with: python -m pip install -U yt-dlp"
    if command -v termux-toast >/dev/null 2>&1; then termux-toast "Instagram Reel download failed" || true; fi
    exit "$status"
fi
