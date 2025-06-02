#!/bin/bash

# Dragon Panel Installer by KS Warrior
sudo bash -c '
# Exit if any command fails
set -e

echo -e "\033[1;32m[+] Starting installation of Dragon Panel...\033[0m"

# Update system and install required packages
echo -e "\033[1;34m[+] Updating packages and installing dependencies...\033[0m"
sudo apt update -y
sudo apt install -y curl git software-properties-common

# Install Node.js 20 if not already installed
if ! command -v node &>/dev/null || [[ $(node -v) != v20* ]]; then
    echo -e "\033[1;34m[+] Installing Node.js 20...\033[0m"
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs
else
    echo -e "\033[1;32m[✓] Node.js 20 already installed.\033[0m"
fi

# Clone the repo
echo -e "\033[1;34m[+] Cloning Dragon Panel repository...\033[0m"
if [ -d "panel" ]; then
    echo -e "\033[1;33m[!] 'panel' directory already exists. Removing...\033[0m"
    rm -rf panel
fi
git clone https://github.com/dragonlabsdev/panel-v1.0.0.git panel

# Go to panel directory
cd panel

# Install dependencies
echo -e "\033[1;34m[+] Installing Node.js packages...\033[0m"
npm install

# Seed database and create admin user
echo -e "\033[1;34m[+] Seeding database and creating admin user...\033[0m"
npm run seed
npm run createUser

# Ask for custom port (optional)
read -p "Enter port to run the panel on (default: 3000): " PANEL_PORT
export PORT=${PANEL_PORT:-3000}

# Start the panel
echo -e "\033[1;32m[✓] Starting Dragon Panel on port ${PORT}...\033[0m"
node .

echo -e "\033[1;36m[✓] Dragon Panel Installed and Running — Powered by KS Warrior\033[0m"
echo -e "\033[1;35mVisit: http://localhost:${PORT} or your server IP\033[0m"
'
