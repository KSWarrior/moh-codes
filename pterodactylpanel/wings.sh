#!/bin/bash

# ─── KS Warrior Pterodactyl Panel Installer ────────
echo "=============================================="
echo "     ⚡ Pterodactyl Panel Installer by KS Warrior ⚡"
echo "   💬 Join our Discord: https://discord.gg/2kAYnH655h"
echo "=============================================="

# Store current directory to return later
original_dir=$(pwd)

# Step 1: Create directory structure
mkdir -p pterodactyl/wings
cd pterodactyl/wings

# Step 2: Create docker-compose.yml file
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  wings:
    image: ghcr.io/pterodactyl/wings:v1.6.1
    restart: always
    networks:
      - wings0
    ports:
      - "8080:8080"
      - "2022:2022"
      - "443:443"
    tty: true
    environment:
      TZ: "UTC"
      WINGS_UID: 988
      WINGS_GID: 988
      WINGS_USERNAME: pterodactyl
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /var/lib/docker/containers/:/var/lib/docker/containers/
      - /etc/pterodactyl/:/etc/pterodactyl/
      - /var/lib/pterodactyl/:/var/lib/pterodactyl/
      - /var/log/pterodactyl/:/var/log/pterodactyl/
      - /tmp/pterodactyl/:/tmp/pterodactyl/
      - /etc/ssl/certs:/etc/ssl/certs:ro
      # Optional: If upgrading from older daemon versions
      # - /srv/daemon-data/:/srv/daemon-data/
      # Optional: Required for SSL if using Let's Encrypt
      # - /etc/letsencrypt/:/etc/letsencrypt/

networks:
  wings0:
    name: wings0
    driver: bridge
    ipam:
      config:
        - subnet: 172.21.0.0/16
    driver_opts:
      com.docker.network.bridge.name: wings0

EOF

# Step 3: Start Docker containers
docker-compose up -d

sudo bash -c '
# fake config
cat <<EOF > config.yml
ka warrior 
EOF
'

# cd on etc/pterodactyl/
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
cd pterodactyl/

# Prompt for multi-line config until user types KS
echo "Enter config: "
config=""
while IFS= read -r line; do
  [[ "$line" == "KS" ]] && break
  config+="$line"$'\n'
done

sudo bash -c '
# real config to file
cat <<EOF > config.yml
$config
EOF
'

# Return to original directory
cd "$original_dir"

# Go into pterodactyl/wings and force-recreate containers
cd pterodactyl/wings
docker-compose up -d --force-recreate
