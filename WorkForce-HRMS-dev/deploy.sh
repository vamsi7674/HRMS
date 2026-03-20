#!/bin/bash
echo "Stopping existing containers..."
docker-compose down

echo "Building and starting new containers..."
docker-compose up --build -d

echo "Cleaning up dangling images..."
docker image prune -f

echo "✅ Local Docker Compose deployment finished successfully!"
