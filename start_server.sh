#!/bin/bash

echo Set environment variables defined in file vars.env
set -o allexport
source vars.env
set +o allexport

echo Create docker volume for PostgreSql
docker volume create --name zahori-database --driver local

echo Download browser images
while read in; do docker pull "$in"; done < browsers

echo Start docker-compose
docker-compose down
docker-compose up
