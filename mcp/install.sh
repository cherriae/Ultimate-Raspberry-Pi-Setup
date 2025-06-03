#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
REPO_DIR=$(dirname "$SCRIPT_DIR")

echo "Script directory: $SCRIPT_DIR"
echo "Repository directory: $REPO_DIR"

# Install Python3 and pip if not present
echo "Installing Python3 and pip..."
apt update
apt install -y python3 python3-pip python3-venv

# Check if requirements.txt exists
REQUIREMENTS_FILE="$REPO_DIR/requirements.txt"
if [ ! -f "$REQUIREMENTS_FILE" ]; then
    echo "Creating requirements.txt..."
    cat > "$REQUIREMENTS_FILE" << EOF
fastapi
uvicorn
pydantic
requests
aiofiles
mcp
EOF
fi

# Install requirements
echo "Installing Python requirements..."
pip3 install -r "$REQUIREMENTS_FILE"

# Create systemd service file
SERVICE_FILE="/etc/systemd/system/mcp-server.service"
echo "Creating systemd service file..."

cat > "$SERVICE_FILE" << EOF
[Unit]
Description=MCP Server
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=$REPO_DIR
ExecStart=/usr/bin/python3 $REPO_DIR/src/mcp_server_on_raspi/server.py
Restart=always
RestartSec=10
Environment=PATH=/usr/bin:/usr/local/bin
Environment=PYTHONPATH=$REPO_DIR

[Install]
WantedBy=multi-user.target
EOF

# Set proper permissions
chmod 644 "$SERVICE_FILE"

# Reload systemd, enable and start service
echo "Configuring service..."
systemctl daemon-reload
systemctl enable mcp-server.service
systemctl start mcp-server.service

echo "MCP Server service installed and started!"
echo "Check status with: systemctl status mcp-server.service"
echo "View logs with: journalctl -u mcp-server.service -f"

# Show service status
sleep 2
systemctl status mcp-server.service --no-pager