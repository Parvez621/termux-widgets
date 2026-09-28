#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
command -v jupyter >/dev/null 2>&1 || { echo "Install Jupyter first: pip install jupyter"; exit 1; }
cd "$HOME"
jupyter notebook --ip=127.0.0.1 --no-browser
