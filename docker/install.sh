sudo apt update
sudo apt upgrade

curl -sSL https://get.docker.com | sh

sudo usermod -aG docker $USER

docker run hello-world