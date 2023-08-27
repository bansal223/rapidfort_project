#!/bin/bash

# Name of your Docker image
IMAGE_NAME=shaanb/hey-rapidfort-project:0.0.1.RELEASE

# Name you want to give your running container
CONTAINER_NAME="my_container"

# Check if the container is already running
if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    echo "Container $CONTAINER_NAME is already running."
    exit 1
fi

# Check if the container exists but is stopped
if [ $(docker ps -aq -f status=exited -f name=$CONTAINER_NAME) ]; then
    # Restart the container
    docker start $CONTAINER_NAME
else
    # Run the container
    docker run --name $CONTAINER_NAME $IMAGE_NAME
fi
