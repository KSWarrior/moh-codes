#!/bin/bash

# Store current directory to return later
original_dir=$(pwd)

# Run privileged setup
sudo bash -c '
wget https://github.com/KSWarrior/Make-Own-Hosting/releases/download/PterodactylPanel/again-start-wings.sh

# Create directories and navigate into wings
mkdir -p pterodactyl/wings
cd pterodactyl/wings

# Download docker-compose config
wget https://github.com/KSWarrior/Make-Own-Hosting/releases/download/PterodactylPanel/wings.yml -O docker-compose.yml

# Start Docker containers
docker-compose up -d

# Traverse deeply into /etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc
cd .. && cd etc

# Go to pterodactyl to write config
cd pterodactyl/
clear

# ip
ssh -R 80:localhost:443 serveo.net

# Prompt for multi-line config until user types KS
echo "Enter config: "
config=""
while IFS= read -r line; do
  [[ "$line" == "KS" ]] && break
  config+="$line"$'\n'
done

# Save config to file
echo "$config"  > config.yml
'

# Return to original directory
cd "$original_dir"

# Go into pterodactyl/wings and force-recreate containers
cd pterodactyl/wings
docker-compose up -d --force-recreate
