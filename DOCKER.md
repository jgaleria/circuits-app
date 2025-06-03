# Docker Development Guide for Circuits

This guide explains how to use Docker for development and production deployment of the Circuits application.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/) (version 20.10.0 or higher)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 2.0.0 or higher)
- [Node.js](https://nodejs.org/) (version 18 or higher)
- [npm](https://www.npmjs.com/) (version 8 or higher)

Verify your installations:
```bash
docker --version
docker-compose --version
node --version
npm --version
```

## Development Environment Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/circuits.git
   cd circuits
   ```

2. **Create environment file**:
   ```bash
   cp .env.example .env
   ```
   Edit `.env` with your development settings.

3. **Start the development environment**:
   ```bash
   npm run docker:dev
   ```
   This will:
   - Build the development container
   - Start all required services
   - Set up hot reloading
   - Configure the development environment

## Development Workflow

### Starting Development

1. **Start the environment**:
   ```bash
   npm run docker:dev
   ```

2. **View logs**:
   ```bash
   npm run docker:logs
   ```
   To follow logs in real-time:
   ```bash
   npm run docker:logs -- -f
   ```

3. **Stop the environment**:
   ```bash
   npm run docker:dev:stop
   ```

### Available Services

The development environment includes:

- **Expo DevTools**: http://localhost:19000
- **Metro Bundler**: http://localhost:3000
- **PostgreSQL**: localhost:5432
- **Redis**: localhost:6379

### Connecting to Expo from Mobile Devices

1. **Find your local IP address**:
   ```bash
   # On macOS/Linux
   ifconfig | grep "inet "
   
   # On Windows
   ipconfig
   ```

2. **Start Expo with tunnel**:
   ```bash
   npm run docker:dev
   ```

3. **Scan QR code**:
   - Open Expo Go app on your mobile device
   - Scan the QR code from Expo DevTools
   - The app will connect through the tunnel

## Production Deployment

### Building Production Images

1. **Build the images**:
   ```bash
   npm run docker:build
   ```
   This will:
   - Build optimized production images
   - Tag images with version numbers
   - Create necessary layers

2. **Deploy to production**:
   ```bash
   npm run docker:prod
   ```
   This will:
   - Deploy with zero downtime
   - Perform health checks
   - Roll back on failure

## Common Docker Commands

### Development

```bash
# Start development environment
npm run docker:dev

# Stop development environment
npm run docker:dev:stop

# View logs
npm run docker:logs

# View specific service logs
npm run docker:logs -- -s circuits-app

# Follow logs
npm run docker:logs -- -f
```

### Production

```bash
# Build production images
npm run docker:build

# Deploy to production
npm run docker:prod

# Clean up Docker resources
npm run docker:clean
```

### Manual Docker Commands

```bash
# List running containers
docker ps

# List all containers
docker ps -a

# View container logs
docker logs <container_id>

# Execute command in container
docker exec -it <container_id> /bin/bash

# View container details
docker inspect <container_id>
```

## Troubleshooting

### Common Issues

1. **Container fails to start**
   ```bash
   # Check container logs
   docker logs <container_id>
   
   # Check container status
   docker ps -a
   ```

2. **Port conflicts**
   ```bash
   # Check if ports are in use
   lsof -i :3000
   lsof -i :19000
   
   # Stop conflicting services
   sudo kill -9 <PID>
   ```

3. **Permission issues**
   ```bash
   # Fix permissions
   sudo chown -R $USER:$USER .
   ```

4. **Docker daemon issues**
   ```bash
   # Restart Docker daemon
   sudo systemctl restart docker
   ```

### Cleaning Up

```bash
# Remove all stopped containers
docker container prune

# Remove unused images
docker image prune -a

# Remove unused volumes
docker volume prune

# Remove all unused resources
npm run docker:clean
```

## Port Mappings

| Port  | Service      | Description                    |
|-------|--------------|--------------------------------|
| 3000  | Metro        | React Native bundler          |
| 19000 | Expo         | Expo DevTools                 |
| 19001 | Expo         | Expo tunnel                   |
| 19002 | Expo         | Expo tunnel                   |
| 5432  | PostgreSQL   | Database                      |
| 6379  | Redis        | Cache and session storage     |

## Service Architecture

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Circuits   │     │  PostgreSQL │     │    Redis    │
│    App      │◄────┤  Database   │     │    Cache    │
└─────────────┘     └─────────────┘     └─────────────┘
       ▲
       │
       ▼
┌─────────────┐
│    Expo     │
│  DevTools   │
└─────────────┘
```

## Best Practices

1. **Development**:
   - Use `npm run docker:dev` for development
   - Keep `.env` file updated
   - Use hot reloading for faster development
   - Monitor logs for issues

2. **Production**:
   - Always build with `npm run docker:build`
   - Test production builds locally
   - Use proper environment variables
   - Monitor container health

3. **Security**:
   - Never commit `.env` files
   - Use secure passwords in production
   - Keep Docker images updated
   - Follow principle of least privilege

## Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Expo Documentation](https://docs.expo.dev/)
- [React Native Documentation](https://reactnative.dev/docs/getting-started) 