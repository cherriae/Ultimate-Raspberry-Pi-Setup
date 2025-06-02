sudo apt update
sudo apt upgrade

docker pull portainer/portainer-ce:latest
docker volume create portainer_data

docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

echo "Portainer installation completed successfully."
echo "You can access the Portainer UI at http://localhost:9443"
echo "Please set up your admin user and connect to the local Docker environment."