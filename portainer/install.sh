#!/bin/bash

echo "Starting Portainer installation..."

# Update system
echo "Updating system packages..."
sudo apt update
sudo apt upgrade -y

# Stop and remove any existing Portainer container
echo "Cleaning up any existing Portainer installation..."
docker stop portainer 2>/dev/null || true
docker rm portainer 2>/dev/null || true

# Pull the latest Portainer image
echo "Pulling Portainer CE image..."
docker pull portainer/portainer-ce:latest

# Create Portainer data volume
echo "Creating Portainer data volume..."
docker volume create portainer_data

# Check what's using port 8000
echo "Checking port usage..."
netstat -tlnp | grep :8000 || ss -tlnp | grep :8000 || echo "Port check tools not available"

# Run Portainer container (using alternative port for HTTP)
echo "Starting Portainer container..."
docker run -d \
  -p 8001:8000 \
  -p 9443:9443 \
  --name=portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce:latest

# Wait a moment for container to start
sleep 5

# Check if container is running
if docker ps | grep -q portainer; then
    echo "✅ Portainer installation completed successfully!"
    echo ""
    echo "🌐 Access Portainer at:"
    echo "   HTTPS: https://localhost:9443"
    echo "   HTTP:  http://localhost:8001"
    echo ""
    echo "📋 Next steps:"
    echo "   1. Open https://localhost:9443 in your browser"
    echo "   2. Create your admin user account"
    echo "   3. Select 'Docker' environment"
    echo "   4. Connect to local Docker environment"
    echo ""
    echo "🔍 Check container status: docker ps"
    echo "📄 View logs: docker logs portainer"
else
    echo "❌ Portainer container failed to start!"
    echo "Check logs with: docker logs portainer"
    exit 1
fi