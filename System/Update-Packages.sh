#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
pkg update -y && pkg upgrade -y
python -m pip install -U yt-dlp || true
echo "Packages updated."
