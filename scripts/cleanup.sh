#!/bin/bash

# cleanup.sh
# Cleans up Docker resources (containers, images, volumes)
# Includes safety checks and confirmation

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}Error: Docker is not running${NC}"
    exit 1
fi

# Function to display resource usage
show_resources() {
    echo "📊 Current Docker resource usage:"
    echo "Containers:"
    docker ps -a
    echo -e "\nImages:"
    docker images
    echo -e "\nVolumes:"
    docker volume ls
    echo -e "\nDisk usage:"
    docker system df
}

# Show current resources
show_resources

# Ask for confirmation
echo -e "\n${YELLOW}⚠️ This will remove all unused Docker resources${NC}"
read -p "Are you sure you want to proceed? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled"
    exit 0
fi

# Stop all running containers
echo "🛑 Stopping all running containers..."
docker-compose down 2>/dev/null || true

# Remove unused containers
echo "🗑️ Removing stopped containers..."
docker container prune -f

# Remove unused images
echo "🗑️ Removing unused images..."
docker image prune -af

# Remove unused volumes
echo "🗑️ Removing unused volumes..."
docker volume prune -f

# Remove unused networks
echo "🗑️ Removing unused networks..."
docker network prune -f

# Remove build cache
echo "🗑️ Removing build cache..."
docker builder prune -f

echo -e "\n${GREEN}✅ Cleanup completed${NC}"
echo "📊 Final resource usage:"
docker system df 