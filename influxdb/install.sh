sudo apt update
sudo apt upgrade

curl https://repos.influxdata.com/influxdata-archive.key | gpg --dearmor | sudo tee /usr/share/keyrings/influxdb-archive-keyring.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/influxdb-archive-keyring.gpg] https://repos.influxdata.com/debian stable main" | sudo tee /etc/apt/sources.list.d/influxdb.list

sudo apt update
sudo apt install influxdb2
sudo systemctl unmask influxdb
sudo systemctl enable influxdb
sudo systemctl start influxdb
echo "InfluxDB installation completed successfully."
echo "You can access the InfluxDB UI at http://localhost:8086"