#!/data/data/com.termux/files/usr/bin/bash

WIDGET_DOWNLOAD_DIR="$HOME/storage/downloads/Termux-Widgets"

ensure_storage() {
    if [ ! -d "$HOME/storage/downloads" ]; then
        echo "Storage is not configured."
        echo "Run: termux-setup-storage"
        exit 1
    fi

    mkdir -p "$WIDGET_DOWNLOAD_DIR"
}

ensure_command() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "Missing dependency: $1"
        exit 1
    fi
}

toast() {
    if command -v termux-toast >/dev/null 2>&1; then
        termux-toast "$1" >/dev/null 2>&1 || true
    fi
}

notify() {
    if command -v termux-notification >/dev/null 2>&1; then
        termux-notification \
            --id "termux-widgets" \
            --title "Termux Widgets" \
            --content "$1" \
            >/dev/null 2>&1 || true
    fi
}