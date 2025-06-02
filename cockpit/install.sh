sudo apt update
sudo apt upgrade -y

echo "deb http://deb.debian.org/debian bookworm-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
sudo apt update

sudo apt install -t bookworm-backports cockpit
echo "Cockpit installation completed successfully."
echo "You can access the Cockpit UI at http://localhost:9090"