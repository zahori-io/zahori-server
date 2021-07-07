#!/bin/bash

# Set environment variables defined in file env-vars.txt
set -o allexport
source env-vars.txt
set +o allexport

# Stop docker-compose
docker-compose down
