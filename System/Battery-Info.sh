#!/data/data/com.termux/files/usr/bin/bash

set -euo pipefail

if ! command -v termux-battery-status >/dev/null 2>&1; then
    echo "Termux:API is required."
    exit 1
fi

battery="$(termux-battery-status)"

percentage="$(echo "$battery" | grep -o '"percentage":[0-9]*' | grep -o '[0-9]*')"
status="$(echo "$battery" | grep -o '"status":"[^"]*"' | cut -d'"' -f4)"
temperature="$(echo "$battery" | grep -o '"temperature":[0-9.]*' | grep -o '[0-9.]*')"

message="Battery: ${percentage:-?}% | ${status:-Unknown} | ${temperature:-?}°C"

if command -v termux-toast >/dev/null 2>&1; then
    termux-toast "$message"
fi

if command -v termux-notification >/dev/null 2>&1; then
    termux-notification \
        --id "battery-info" \
        --title "Battery Status" \
        --content "$message"
fi