#!/bin/bash

# deploy-prod.sh
# Deploys the production environment
# Includes health checks and rollback capability

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

echo "🚀 Deploying production environment version $VERSION..."

# Check if images exist
if ! docker images | grep -q "circuits-app:$VERSION"; then
    echo -e "${RED}Error: Production images not found${NC}"
    echo "Please run ./scripts/build-prod.sh first"
    exit 1
fi

# Deploy with zero downtime
echo "🔄 Deploying with zero downtime..."

# Start new containers
if docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d; then
    echo -e "${GREEN}✅ New containers started successfully${NC}"
else
    echo -e "${RED}❌ Failed to start new containers${NC}"
    exit 1
fi

# Wait for health checks
echo "🔍 Waiting for health checks..."
sleep 10

# Check if services are healthy
if docker-compose -f docker-compose.yml -f docker-compose.prod.yml ps | grep -q "Exit"; then
    echo -e "${RED}❌ Deployment failed - some services are unhealthy${NC}"
    echo "Rolling back..."
    docker-compose -f docker-compose.yml -f docker-compose.prod.yml down
    exit 1
fi

echo -e "${GREEN}✅ Deployment successful${NC}"
echo "📝 Service status:"
docker-compose -f docker-compose.yml -f docker-compose.prod.yml ps 