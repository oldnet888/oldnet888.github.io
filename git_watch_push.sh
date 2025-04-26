#!/bin/bash
REPO_PATH="/path/to/your/repo"
while true; do
  inotifywait -r -e modify,create,delete "$REPO_PATH"
  cd "$REPO_PATH"
  git add .
  git commit -m "Auto-commit on change at $(date +'%Y-%m-%d %H:%M:%S')"
  git push origin main
  sleep 1  # 最小间隔 1 秒
done