#!/bin/bash

# Set environment variables defined in file env-vars.txt
set -o allexport
source env-vars.txt
set +o allexport

echo Create docker volume for PostgreSql
docker volume create --name zahori-database --driver local

# Start docker-compose
docker-compose down
docker-compose up
