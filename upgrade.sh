#!/bin/bash
# Script to upgrade Zahori to the latest version available

read -p "¿Are you sure you want to upgrade the server to the latest version available? (Y/n): " upgrade_choice
if [ "$upgrade_choice" == "Y" ]; then

    current_commit=$(git rev-parse --short HEAD)

    echo "1. Stopping zahori server..."
    bash stop_server.sh

    echo "2. Backing up server status..."
    bash backup.sh

    echo "3. Pulling git repository from master branch..."
    git checkout master
    git pull

    echo "4. Starting zahori server..."
    bash start_server.sh

fi
