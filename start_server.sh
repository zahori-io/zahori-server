#!/bin/bash

echo Set environment variables defined in file env-vars.txt
set -o allexport
source env-vars.txt
set +o allexport

echo Creating database volume
docker volume create --name zahori-database

if [ "$RESTORE_DATABASE_ENABLED" == "1" ]; then
  echo "Restoring database..."
  docker run --rm \
    --volume "zahori-database:/tmp/restored" \
    --volume "$RESTORE_DIRECTORY:/tmp/backup" \
    ubuntu \
    tar xvf "/tmp/backup/$RESTORE_DATABASE_FILE" -C "/tmp/restored" --strip 1
fi

echo Creating evidences volume
docker volume create --name zahori-evidences

if [ "$RESTORE_EVIDENCES_ENABLED" == "1" ]; then
  echo "Restoring evidences..."
  docker run --rm \
    --volume "zahori-evidences:/tmp/restored" \
    --volume "$RESTORE_DIRECTORY:/tmp/backup" \
    ubuntu \
    tar xvf "/tmp/backup/$RESTORE_EVIDENCES_FILE" -C "/tmp/restored" --strip 1
fi

echo Creating logs volume
docker volume create --name zahori-logs

echo Download browser images
while read -r in
do
  echo "docker pull $in"
  docker pull "$in"
done < browsers

echo Start docker-compose
docker-compose down
docker-compose up
