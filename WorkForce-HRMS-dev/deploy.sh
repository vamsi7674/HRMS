#!/bin/bash
set -e

echo "Stopping existing containers..."
docker-compose down || true

echo "Building backend Docker image manually (bypassing buildx requirement)..."
docker build -f Dockerfile.local -t workforce-backend-local:latest .

echo "Starting containers (skipping rebuild since image is already built)..."
docker-compose up -d --no-build

echo "Cleaning up dangling images..."
docker image prune -f

echo "Waiting for backend to be healthy..."
sleep 10
docker ps

echo "✅ Local Docker Compose deployment finished successfully!"
