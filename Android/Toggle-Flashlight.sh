#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
command -v termux-torch >/dev/null 2>&1 || { echo "Install Termux:API and run: pkg install termux-api"; exit 1; }
state_file="$HOME/.cache/termux-widget-flashlight"
mkdir -p "$(dirname "$state_file")"
if [ "$(cat "$state_file" 2>/dev/null || echo off)" = on ]; then
    termux-torch off
    echo off > "$state_file"
    echo "Flashlight off"
else
    termux-torch on
    echo on > "$state_file"
    echo "Flashlight on"
fi
