#!/bin/bash
# Script to rollback to the most recent backup

read -p "¿Are you sure you want to rollback to previous version? (Y/n): " rollback_choice
if [ "$rollback_choice" == "Y" ]; then

  echo "1. Stopping zahori server..."
  bash stop_server.sh

  echo "2. Rolling back to latest backup version"
  echo -e "1\nY" | ./backup-restore.sh

  echo "3. Starting zahori server..."
  bash start_server.sh
fi

