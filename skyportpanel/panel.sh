#!/bin/bash

sudo bash -c '
# Update package list and install dependencies
sudo apt update
sudo apt install -y curl software-properties-common
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install nodejs -y 
sudo apt install git -y

echo_message "* Installed Dependencies"

echo_message "* Installing Files"

# Create directory, clone repository, and install files
mkdir -p panel5
cd panel5 || { echo_message "Failed to change directory to skyport"; exit 1; }
git clone https://github.com/achul123/panel5.git
cd panel5 || { echo_message "Failed to change directory to panel"; exit 1; }
npm install

# Run setup scripts
clear
npm run seed
npm run createUser

# Install panel and start the application
sudo npm install -g pm2
pm2 start index.js


# Clear the screen after finishing
clear
echo "Skyport Installed by using KS Warrior code"
'
