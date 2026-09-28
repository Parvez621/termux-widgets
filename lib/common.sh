#!/data/data/com.termux/files/usr/bin/bash

WIDGET_DOWNLOAD_DIR="$HOME/storage/downloads/Termux-Widgets"

ensure_storage() {
    if [ ! -d "$HOME/storage/downloads" ]; then
        echo "Shared storage is not configured. Run: termux-setup-storage"
        exit 1
    fi
    mkdir -p "$WIDGET_DOWNLOAD_DIR"
}

ensure_command() {
    command -v "$1" >/dev/null 2>&1 || {
        echo "Missing dependency: $1"
        echo "Run ./install.sh or install it manually."
        exit 1
    }
}

toast() {
    if command -v termux-toast >/dev/null 2>&1; then
        termux-toast "$1" || true
    fi
}
