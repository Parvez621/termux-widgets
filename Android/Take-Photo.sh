#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
command -v termux-camera-photo >/dev/null 2>&1 || { echo "Install Termux:API and run: pkg install termux-api"; exit 1; }
mkdir -p "$HOME/storage/dcim/Termux-Widgets"
output="$HOME/storage/dcim/Termux-Widgets/photo-$(date +%Y%m%d-%H%M%S).jpg"
termux-camera-photo -c 0 "$output"
echo "Saved: $output"
