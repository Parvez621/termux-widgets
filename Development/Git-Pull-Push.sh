#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
read -rp "Git repository directory: " repo
cd "$repo"
git pull --rebase
read -rp "Commit message (leave empty to skip commit): " message
if [ -n "$message" ]; then
    git add -A
    git commit -m "$message"
    git push
fi
