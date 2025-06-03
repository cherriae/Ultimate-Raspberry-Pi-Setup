#!/bin/bash

# Update system
sudo apt update
sudo apt upgrade -y

# Create directory structure
sudo mkdir -p /opt/stacks/filebrowser/data
sudo mkdir -p /opt/stacks/filebrowser/config

# Create database file
touch /opt/stacks/filebrowser/data/database.db

# Create Docker Compose file
cat > /opt/stacks/filebrowser/docker-compose.yml <<EOF
version: '3.8'

services:
  filebrowser:
    image: filebrowser/filebrowser:latest
    container_name: filebrowser
    restart: unless-stopped
    ports:
      - "8000:80"
    volumes:
      - ./data:/database
      - ./config:/config
      - /home:/srv/home:ro
      - /opt:/srv/opt:ro
      - /var/log:/srv/logs:ro
    environment:
      - FB_DATABASE=/database/database.db
    command: --database /database/database.db --root /srv
EOF

# Set proper ownership
sudo chown -R $USER:$USER /opt/stacks/filebrowser

# Change to the directory and start
cd /opt/stacks/filebrowser
docker compose up -d

echo "File Browser installation completed successfully."
echo "Access it at: http://localhost:8000"
echo "Default login: admin/admin"