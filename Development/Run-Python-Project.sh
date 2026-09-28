#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
read -rp "Python project directory: " project
[ -d "$project" ] || { echo "Directory not found."; exit 1; }
cd "$project"
if [ -f main.py ]; then python main.py
elif [ -f app.py ]; then python app.py
else echo "No main.py or app.py found."; exit 1
fi
