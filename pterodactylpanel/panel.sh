#!/bin/bash

# Run everything as root
sudo bash -c '
# ─── KS Warrior Pterodactyl Panel Installer ────────────────
echo "=============================================="
echo "     ⚡ Pterodactyl Panel Installer by KS Warrior ⚡"
echo "   💬 Join our Discord: https://discord.gg/2kAYnH655h"
echo "=============================================="

# Exit on error
set -e

# Create and enter panel directory
mkdir -p /root/pterodactyl/panel
cd /root/pterodactyl/panel

# Download panel.yml as docker-compose.yml
wget -q https://raw.githubusercontent.com/KSWarrior/moh-codes/refs/heads/main/pterodactylpanel/panel.yml -O docker-compose.yml

# Start the containers
docker-compose up -d

# Run user creation interactively
docker-compose run --rm panel php artisan p:user:make
'
