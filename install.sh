#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
SHORTCUTS="$HOME/.shortcuts"

mkdir -p "$SHORTCUTS"

pkg update -y
pkg install -y git curl wget python ffmpeg

python -m pip install -U yt-dlp

for category in Media System Development Android; do
    mkdir -p "$SHORTCUTS/$category"
    cp -f "$ROOT_DIR/$category"/*.sh "$SHORTCUTS/$category/"
done

chmod 700 -R "$SHORTCUTS"
find "$SHORTCUTS" -type f -name '*.sh' -exec chmod 700 {} \;

mkdir -p "$HOME/storage/downloads/Termux-Widgets"
mkdir -p "$HOME/.config/termux-widgets"
cp -f "$ROOT_DIR/lib/common.sh" "$HOME/.config/termux-widgets/common.sh"
chmod 700 "$HOME/.config/termux-widgets" "$HOME/.config/termux-widgets/common.sh"

echo
echo "Installed Termux Widgets."
echo "Open Termux:Widget and refresh the widget list."
echo "Downloads: $HOME/storage/downloads/Termux-Widgets"
