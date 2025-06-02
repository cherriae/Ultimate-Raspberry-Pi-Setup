sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install -y grafana

# Create backup of original config
sudo cp /etc/grafana/grafana.ini /etc/grafana/grafana.ini.bak

# Change default port from 3000 to 3100
sudo sed -i 's/^;http_port = 3000/http_port = 3100/' /etc/grafana/grafana.ini

# Enable and start Grafana service
sudo /bin/systemctl enable grafana-server
sudo /bin/systemctl start grafana-server

echo "Grafana installed and configured to use port 3100"
echo "Access the Grafana web interface at http://localhost:3100"