#!/bin/bash

# Set environment variables defined in file vars.env
set -o allexport
source vars.env
set +o allexport

# Stop docker-compose
docker-compose down
