#!/bin/bash

# Set environment variables defined in file env-vars.txt
set -o allexport
source env-vars.txt
set +o allexport

# Stop docker-compose
docker-compose down

if [ "$BACKUP_DATABASE_ENABLED" == "1" ]; then
  echo "Launching database backup..."
  docker run --rm \
    --volume "zahori-database:/tmp/data" \
    --volume "$BACKUP_DIRECTORY:/tmp/backup" \
    ubuntu \
    tar cvf "/tmp/backup/$BACKUP_DATABASE_FILE" "/tmp/data"
fi
if [ "$BACKUP_EVIDENCES_ENABLED" == "1" ]; then
  echo "Launching evidences backup..."
  docker run --rm \
    --volume "zahori-evidences:/tmp/data" \
    --volume "$BACKUP_DIRECTORY:/tmp/backup" \
    ubuntu \
    tar cvf "/tmp/backup/$BACKUP_EVIDENCES_FILE" "/tmp/data"
fi

echo "Launching logs backup..."
docker run --rm \
  --volume "zahori-logs:/tmp/logs" \
  --volume "$BACKUP_DIRECTORY:/tmp/backup" \
  ubuntu \
  tar cvf "/tmp/backup/$BACKUP_LOGS_FILE" "/tmp/logs"