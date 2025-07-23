#!/bin/bash

set -e

CONTAINER_NAME="supremedental-docs"
PORT=8000
IMAGE="beauburra/supremedental-mainhub:latest"

# echo "📦 Pulling latest image: $IMAGE"
docker pull "$IMAGE"

# Stop and remove existing container
docker stop "$CONTAINER_NAME" > /dev/null 2>&1 || true
docker rm "$CONTAINER_NAME" > /dev/null 2>&1 || true

# Check for any other container using port $PORT
CONFLICTING_CONTAINER=$(docker ps --format '{{.ID}} {{.Ports}}' | grep ":$PORT->" | awk '{print $1}' || true)

if [ -n "$CONFLICTING_CONTAINER" ]; then
  docker stop "$CONFLICTING_CONTAINER" > /dev/null 2>&1
  docker rm "$CONFLICTING_CONTAINER" > /dev/null 2>&1
fi

# Start new container (suppress container ID output)
docker run -d --name "$CONTAINER_NAME" -p $PORT:8000 "$IMAGE" > /dev/null

echo "✅ Latest site is running at: http://localhost:$PORT"
echo "   • To stop the site & container, run: docker stop $CONTAINER_NAME"
echo "   • To remove the container, run: docker rm $CONTAINER_NAME"
