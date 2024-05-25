# Makefile for Docker Compose Git Setup

# Define environment variables
export REMOTE_URL=git@github.com:quality-specialist/seventh-action-react-demo.git
DEFAULT_COMMIT_MESSAGE="Initial Commit"
DEFAULT_BRANCH_NAME="main"

# Define targets

.PHONY: all build up exec clean gst gad gpu gpl gcm glg gck gnb

# Default target
all: build up

# Build Docker images with no cache
build:
	@echo "Building Docker images..."
	docker-compose build --no-cache

# Run Docker containers in detached mode
up:
	@echo "Starting Docker containers..."
	docker-compose up -d

# Execute bash in myapp container
exec:
	@echo "Starting interactive shell in myapp container..."
	docker-compose exec myapp /bin/bash

# Clean up Docker resources
clean:
	@echo "Cleaning up Docker resources..."
	docker-compose down
	docker system prune -f

# Git status
gst:
	@echo "Checking status of git repositories..."
	docker-compose exec myapp git status

# Git add
gad:
	@echo "Adding changes to git repositories..."
	docker-compose exec myapp git add -A

# Git commit (gcm)
gcm:
	@echo "Committing changes to git repositories..."
	docker-compose exec myapp git commit -m "${m=$(DEFAULT_COMMIT_MESSAGE)}"

# Git push
gpu:
	@echo "Pushing changes to remote repositories..."
	docker-compose exec myapp git push origin main

# Git pull
gpl:
	@echo "Pulling changes from remote repositories..."
	docker-compose exec myapp git pull origin main

# Git log
glg:
	@echo "Fetching git log of repositories..."
	docker-compose exec myapp git log

# Git checkout (gck)
gck:
	@echo "Checking out to branch ${b=$(DEFAULT_BRANCH_NAME)}..."
	docker-compose exec myapp git checkout ${b=$(DEFAULT_BRANCH_NAME)}

# Git checkout -b (gnb)
gnb:
	@echo "Creating and checking out to new branch ${b=$(DEFAULT_BRANCH_NAME)}..."
	docker-compose exec myapp git checkout -b ${b=$(DEFAULT_BRANCH_NAME)}

# List of Git-related goals
git:
	@echo "Git-related Makefile goals:"
	@echo "  gst   - Git status"
	@echo "  gad   - Git add"
	@echo "  gcm   - Git commit (use m)"
	@echo "  gpu   - Git push"
	@echo "  gpl   - Git pull"
	@echo "  glg   - Git log"
	@echo "  gck   - Git checkout (use b)"
	@echo "  gnb   - Git checkout -b (create new branch, use b)"