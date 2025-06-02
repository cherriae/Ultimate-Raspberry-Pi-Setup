sudo apt update
sudo apt upgrade -y

sudo mkdir -p /opt/stacks/filebrowser
mv ./filebrowser /opt/stacks/filebrowser/filebrowser
cd /opt/stacks/filebrowser

sudo mkdir data config
sudo touch ./data/database.db

sudo echo "{\n  "port": 8000,\n  "baseURL": "",\n  "address": "",\n  "log": "stdout",\n  "database": "/database.db",\n  "root": "/srv"\n}" > ./config/filebrowser.json
sudo chown -R $USER:$USER ./config ./data

sudo docker compose up -d
sudo echo "File Browser installation completed successfully."
sudo echo "You can access the File Browser UI at http://localhost:8000"