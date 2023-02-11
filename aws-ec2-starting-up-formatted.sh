#!/bin/bash

# Setting commands to stop executing if any command fails to execute correctly.
set -e

# Updating OS
echo -e "\033[1;95m"
echo "Updating the Operating System..."
echo -e '\033[0;107m'
sudo yum -y update
echo -e "\033[1;92m"
echo "Updated Packages in Amazon Linux AMI 2."

# Installing and enabling Docker
echo -e "\033[1;95m"
echo "Installing and enabling Docker on the Server..."
echo -e '\033[0;107m'
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod 777 /var/run/docker.sock
docker ps
echo -e "\033[1;92m"
echo "Installed and enabled Docker on the Server."

# Installing Docker Compose v2.16.0
echo -e "\033[1;95m"
echo "Installing and enabling Docker-Compose on the Server..."
echo -e '\033[0;107m'
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose
docker-compose --version
echo -e "\033[1;92m"
echo "Installed and enabled Docker-Compose on the Server."

# Installing Git
echo -e "\033[1;95m"
echo "Installing Git on the Server..."
echo -e '\033[0;107m'
sudo yum install -y git
echo -e "\033[1;32mInstalled Git on the Server."
