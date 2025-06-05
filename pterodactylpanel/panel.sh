#!/bin/bash

# Elevate to root and execute all commands
sudo bash -c '
# Create directories
mkdir -p pterodactyl/panel
cd pterodactyl/panel

# Download the docker-compose file for the panel
wget https://raw.githubusercontent.com/KSWarrior/moh-codes/refs/heads/main/pterodactylpanel/panel.yml -O docker-compose.yml

# Install required packages
apt update && apt upgrade -y
apt install docker-compose

# Start the containers in detached mode
docker-compose up -d

# Run the user creation command inside the panel container
docker-compose run --rm panel php artisan p:user:make
'.
