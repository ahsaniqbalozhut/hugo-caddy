#!/bin/bash

# -------- CONFIG --------
DEPLOY_TO_DO=true                 # <<< set to false for local deployment
REMOTE_USER="root"
REMOTE_HOST="your.server.ip"
IMAGE_NAME="yourdockerhub/hugo-caddy:latest"
DOMAIN="yourdomain.com"
# ------------------------

echo "[1/3] Pulling latest image..."
docker pull $IMAGE_NAME

if [ "$DEPLOY_TO_DO" = true ]; then
  echo "[2/3] Deploying on DigitalOcean..."
  ssh ${REMOTE_USER}@${REMOTE_HOST} <<EOF
    docker pull $IMAGE_NAME
    docker stop hugo-caddy 2>/dev/null && docker rm hugo-caddy 2>/dev/null
    docker run -d --name hugo-caddy -p 80:80 \
      -v caddy_data:/data -v caddy_config:/config \
      -e DOMAIN=$DOMAIN $IMAGE_NAME
EOF
else
  echo "[2/3] Deploying locally..."
  docker stop hugo-caddy 2>/dev/null && docker rm hugo-caddy 2>/dev/null
  docker run -d --name hugo-caddy -p 8080:80 \
    -v caddy_data:/data -v caddy_config:/config \
    -e DOMAIN=$DOMAIN $IMAGE_NAME
fi

echo "[3/3] Deployment complete."
