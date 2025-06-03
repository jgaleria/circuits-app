#!/bin/bash

# dev-stop.sh
# Stops the development environment and cleans up containers
# Includes error handling and confirmation

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🛑 Stopping Circuits development environment..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo -e "${RED}Error: Docker is not running${NC}"
    exit 1
fi

# Check if containers are running
if ! docker-compose ps | grep -q "Up"; then
    echo -e "${YELLOW}⚠️ No running containers found${NC}"
    exit 0
fi

# Ask for confirmation
read -p "Are you sure you want to stop all development containers? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled"
    exit 0
fi

# Stop containers
if docker-compose down; then
    echo -e "${GREEN}✅ Development environment stopped successfully${NC}"
else
    echo -e "${RED}❌ Failed to stop development environment${NC}"
    exit 1
fi

# Optional: Remove volumes
read -p "Do you want to remove volumes as well? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    if docker-compose down -v; then
        echo -e "${GREEN}✅ Volumes removed successfully${NC}"
    else
        echo -e "${RED}❌ Failed to remove volumes${NC}"
        exit 1
    fi
fi 