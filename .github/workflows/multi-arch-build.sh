#!/bin/bash

# Local .env
echo ".env will be loaded if it exists...";
if [ -f .env ]; then
    # Load Environment Variables
    export $(cat .env | grep -v '#' | sed 's/\r$//' | awk '/=/ {print $1}' )
    echo "Loaded .env file";
fi

# Check if a local builder already exists
echo "Checking if a docker builder already exists...";
if [ $(docker buildx ls  2>/dev/null | wc -l) > 0 ]; then
    echo "Creating Docker builder...";
    docker buildx create --name "ucontrol_builder" --use
    echo "Creating Docker builder... Done."
fi

#echo "Logging into container registry as ${GITHUB_USER}..."
#docker login ghcr.io -u ${GITHUB_USER} -p ${GITHUB_PAT} 
#echo "Logging into container registry... Done."

echo "Starting Docker image build..."
#echo "Tagging image with '${TAG_SERVICE_TAG}'..."
docker buildx build --push --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 --tag ghcr.io/tulsasoftware/ucontrol-genesis-tag-service:test .
echo "Docker image build... Done."