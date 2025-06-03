# Oh My Zsh configuration
export ZSH="/home/developer/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker docker-compose npm node)

source $ZSH/oh-my-zsh.sh

# Development aliases
alias dev="npm run dev"
alias start="npm start"
alias test="npm test"
alias lint="npm run lint"
alias build="npm run build"

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"

# Docker aliases
alias dc="docker-compose"
alias dps="docker ps"
alias dex="docker exec -it"

# Node/Expo aliases
alias expo="npx expo"
alias expo-start="npx expo start"
alias expo-android="npx expo start --android"
alias expo-ios="npx expo start --ios"
alias expo-web="npx expo start --web"

# Path configuration
export PATH="/home/developer/.npm-global/bin:$PATH"
export PATH="/home/developer/.local/bin:$PATH"

# Node environment
export NODE_ENV=development

# Editor configuration
export EDITOR="code --wait" 