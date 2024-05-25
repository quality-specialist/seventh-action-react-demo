# Makefile for Docker Compose Git Setup

# Define environment variables
export REMOTE_URL=git@github.com:quality-specialist/seventh-action-react-demo.git

# Define targets

.PHONY: all build up exec clean

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
