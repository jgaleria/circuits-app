FROM node:18-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    zsh \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install additional development tools
RUN npm install -g \
    typescript \
    @types/node \
    expo-cli \
    yarn \
    nodemon \
    ts-node

# Create a non-root user
RUN useradd -m -s /bin/zsh -u 1000 developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set up Zsh configuration
COPY .devcontainer/.zshrc /home/developer/.zshrc
RUN chown -R developer:developer /home/developer

# Switch to non-root user
USER developer
WORKDIR /app

# Set up Zsh as default shell
SHELL ["/bin/zsh", "-c"] 