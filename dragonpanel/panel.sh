#!/bin/bash

sudo bash -c '
# ─── KS Warrior Dragon Panel Installer ────────────────
echo "=============================================="
echo "     ⚡ PufferPanel Installer by KS Warrior ⚡"
echo "   💬 Join our Discord: https://discord.gg/2kAYnH655h"
echo "=============================================="

# Update package list and install dependencies
sudo apt update
sudo apt install -y curl software-properties-common
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo apt install git -y

# Create directory, clone repository, and install files
git clone https://github.com/dragonlabsdev/panel-v1.0.0.git
mv panel-v1.0.0 panel
cd panel
npm install
npm run seed
npm run createUser
node .

echo "Dragon Panel Installed by using KS Warrior Code"
'
