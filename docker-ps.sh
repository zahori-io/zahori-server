#!/bin/bash
# Script to display the usage of CPU and memory of the docker containers

# Column titles
echo -e "CONTAINER_ID  NAME                             CPU    MEM_USAGE              IMAGE"

# Get docker stats and the name of the docker images
docker stats --no-stream --format "{{.ID}} {{.Name}} {{.CPUPerc}} {{.MemUsage}}" | while read line; do
    container_id=$(echo $line | awk '{print $1}')
    image=$(docker inspect --format '{{.Config.Image}}' $container_id)

    echo "$line $image"
done | column -t

