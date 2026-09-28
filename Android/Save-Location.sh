#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
command -v termux-location >/dev/null 2>&1 || { echo "Install Termux:API and run: pkg install termux-api"; exit 1; }
mkdir -p "$HOME/storage/shared/Termux-Widgets"
output="$HOME/storage/shared/Termux-Widgets/location-$(date +%Y%m%d-%H%M%S).json"
termux-location -p gps -r once > "$output"
echo "Saved: $output"
