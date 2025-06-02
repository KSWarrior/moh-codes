#!/bin/bash

# Run everything as root
sudo bash -c '

# === Helper Function ===
echo_message() {
  echo -e "\n============================"
  echo -e "$1"
  echo -e "============================\n"
}

# === Update and install dependencies ===
echo_message "Updating and installing dependencies"
apt update
apt install -y curl software-properties-common git
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

# === Clone the repository ===
echo_message "Cloning panel repository"
mkdir -p /opt/panel5
cd /opt/panel5 || { echo_message "Failed to change directory to /opt/panel5"; exit 1; }

# If repo already exists, remove it
rm -rf panel5
git clone https://github.com/achul123/panel5.git
cd panel5 || { echo_message "Failed to change directory to panel5"; exit 1; }

# === Install node modules ===
echo_message "Installing npm dependencies"
npm install

# === Run initial setup ===
echo_message "Running setup scripts"
npm run seed
npm run createUser

# === Install and configure PM2 ===
echo_message "Setting up PM2 process manager"
npm install -g pm2
pm2 start index.js --name skyport-panel
pm2 save
pm2 startup systemd -u $(whoami) --hp $HOME | bash

# === Finished ===
clear
echo_message "✅ Skyport Installed using KS Warrior code!"
'
