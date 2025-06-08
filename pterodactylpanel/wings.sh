#!/bin/bash

# ─── KS Warrior Pterodactyl Panel Installer ────────
echo "=============================================="
echo "     ⚡ Pterodactyl Panel Installer by KS Warrior ⚡"
echo "   💬 Join our Discord: https://discord.gg/2kAYnH655h"
echo "=============================================="

# Step 1: Create directory structure
mkdir -p pterodactyl/wings
cd pterodactyl/wings

# Step 2: Create docker-compose.yml file
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  wings:
    image: ghcr.io/pterodactyl/wings:v1.6.1
    container_name: wings
    restart: always
    tty: true
    environment:
      TZ: "UTC"  # Change to your local time zone if needed
      WINGS_UID: 988
      WINGS_GID: 988
      WINGS_USERNAME: pterodactyl
    ports:
      - "8080:8080"   # Panel communication
      - "2022:2022"   # SFTP
      - "443:443"     # HTTPS (optional for SSL)
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /var/lib/docker/containers/:/var/lib/docker/containers/
      - /etc/pterodactyl/:/etc/pterodactyl/
      - /var/lib/pterodactyl/:/var/lib/pterodactyl/
      - /var/log/pterodactyl/:/var/log/pterodactyl/
      - /tmp/pterodactyl/:/tmp/pterodactyl/
      - /etc/ssl/certs:/etc/ssl/certs:ro
      - /etc/letsencrypt/:/etc/letsencrypt/  # Optional: for Let's Encrypt SSL
      # - /srv/daemon-data/:/srv/daemon-data/  # Optional: for older data migration
    networks:
      - wings0
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "3"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8080/ping"]
      interval: 30s
      timeout: 10s
      retries: 3

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