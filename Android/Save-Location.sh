#!/data/data/com.termux/files/usr/bin/bash

set -euo pipefail

if ! command -v termux-location >/dev/null 2>&1; then
    echo "Termux:API is required."
    exit 1
fi

if [ ! -d "$HOME/storage/shared" ]; then
    echo "Run termux-setup-storage first."
    exit 1
fi

output_dir="$HOME/storage/shared/Termux-Widgets"

mkdir -p "$output_dir"

output="$output_dir/location-$(date +%Y%m%d-%H%M%S).json"

if termux-location -p gps -r once > "$output"; then
    termux-toast "Location saved"
else
    termux-toast "Could not get location"
    rm -f "$output"
    exit 1
fi