#!/bin/bash

# dev-start.sh
# Starts the development environment using Docker Compose
# Includes error handling and status checks

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "🚀 Starting Circuits development environment..."

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

# Start the development environment
if docker-compose up -d; then
    echo -e "${GREEN}✅ Development environment started successfully${NC}"
    echo "📝 Available services:"
    echo "  - Expo DevTools: http://localhost:19000"
    echo "  - Metro Bundler: http://localhost:3000"
    echo "  - PostgreSQL: localhost:5432"
    echo "  - Redis: localhost:6379"
else
    echo -e "${RED}❌ Failed to start development environment${NC}"
    exit 1
fi

# Check if services are healthy
echo "🔍 Checking service health..."
if docker-compose ps | grep -q "Exit"; then
    echo -e "${RED}❌ Some services failed to start${NC}"
    docker-compose ps
    exit 1
fi

echo -e "${GREEN}✅ All services are running${NC}" 