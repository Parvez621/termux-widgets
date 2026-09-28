#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

command -v ffmpeg >/dev/null 2>&1 || { echo "ffmpeg is not installed."; exit 1; }

read -rp "Media file path: " input
[ -f "$input" ] || { echo "File not found: $input"; exit 1; }

output="${input%.*}.mp3"
ffmpeg -i "$input" -vn -codec:a libmp3lame -q:a 2 "$output"
echo "Created: $output"
