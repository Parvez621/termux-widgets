#!/data/data/com.termux/files/usr/bin/bash

set -euo pipefail

if ! command -v termux-torch >/dev/null 2>&1; then
    echo "Termux:API is required."
    exit 1
fi

state_file="$HOME/.cache/termux-widgets/flashlight"

mkdir -p "$(dirname "$state_file")"

state="$(cat "$state_file" 2>/dev/null || echo off)"

if [ "$state" = "on" ]; then
    termux-torch off
    echo off > "$state"
    termux-toast "Flashlight OFF"
else
    termux-torch on
    echo on > "$state"
    termux-toast "Flashlight ON"
fi