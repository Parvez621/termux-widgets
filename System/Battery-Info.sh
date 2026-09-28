#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
command -v termux-battery-status >/dev/null 2>&1 || { echo "Install Termux:API and run: pkg install termux-api"; exit 1; }
termux-battery-status
