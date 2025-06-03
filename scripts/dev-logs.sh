#!/bin/bash

# dev-logs.sh
# Displays logs from development containers
# Supports filtering by service and following logs

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

# Parse command line arguments
FOLLOW=false
SERVICE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--follow)
            FOLLOW=true
            shift
            ;;
        -s|--service)
            SERVICE="$2"
            shift 2
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo "Usage: $0 [-f|--follow] [-s|--service SERVICE_NAME]"
            exit 1
            ;;
    esac
done

# Check if containers are running
if ! docker-compose ps | grep -q "Up"; then
    echo -e "${YELLOW}⚠️ No running containers found${NC}"
    exit 1
fi

# Display logs
echo "📋 Displaying logs..."

if [ -n "$SERVICE" ]; then
    if [ "$FOLLOW" = true ]; then
        docker-compose logs -f "$SERVICE"
    else
        docker-compose logs "$SERVICE"
    fi
else
    if [ "$FOLLOW" = true ]; then
        docker-compose logs -f
    else
        docker-compose logs
    fi
fi 