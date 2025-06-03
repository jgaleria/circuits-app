#!/bin/bash

# build-prod.sh
# Builds production Docker images
# Includes versioning and tagging

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

# Check if .env file exists
if [ ! -f .env ]; then
    echo -e "${RED}Error: .env file not found${NC}"
    echo "Please create a .env file with required environment variables"
    exit 1
fi

# Get version from package.json
VERSION=$(node -p "require('./package.json').version")
if [ -z "$VERSION" ]; then
    echo -e "${RED}Error: Could not determine version from package.json${NC}"
    exit 1
fi

echo "🏗️ Building production images for version $VERSION..."

# Build images
if docker-compose -f docker-compose.yml -f docker-compose.prod.yml build; then
    echo -e "${GREEN}✅ Production images built successfully${NC}"
else
    echo -e "${RED}❌ Failed to build production images${NC}"
    exit 1
fi

# Tag images
echo "🏷️ Tagging images..."
docker tag circuits-app:latest circuits-app:$VERSION
docker tag circuits-redis:latest circuits-redis:$VERSION
docker tag circuits-postgres:latest circuits-postgres:$VERSION

echo -e "${GREEN}✅ Images tagged successfully${NC}"
echo "📝 Available images:"
docker images | grep "circuits-" 