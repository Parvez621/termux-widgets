#!/data/data/com.termux/files/usr/bin/bash

set -euo pipefail

if ! command -v termux-camera-photo >/dev/null 2>&1; then
    echo "Termux:API is required."
    exit 1
fi

if [ ! -d "$HOME/storage/dcim" ]; then
    echo "Run termux-setup-storage first."
    exit 1
fi

output_dir="$HOME/storage/dcim/Termux-Widgets"

mkdir -p "$output_dir"

output="$output_dir/photo-$(date +%Y%m%d-%H%M%S).jpg"

if termux-camera-photo -c 0 "$output"; then
    termux-toast "Photo saved"
else
    termux-toast "Camera failed"
    exit 1
fi