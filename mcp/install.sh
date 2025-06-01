#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

# Get the directory of the server.py script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
REPO_DIR=$(dirname "$(dirname "$SCRIPT_DIR")")

# Install requirements if needed
echo "Installing Python requirements..."
pip3 install -r "$REPO_DIR/requirements.txt"

mv "$REPO_DIR/mcp-server.service" /etc/systemd/system/mcp-server.service

# Reload systemd, enable and start service
echo "Configuring service..."
systemctl daemon-reload
systemctl enable mcp-server.service
systemctl start mcp-server.service

echo "MCP Server service installed and started!"
echo "Check status with: systemctl status mcp-server.service"