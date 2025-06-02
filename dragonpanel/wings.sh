#!/bin/bash

sudo bash -c '
# Update package list and install dependencies
sudo apt update
sudo apt install -y curl software-properties-common
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo apt install git -y

# Create directory, clone repository, and install files
git clone https://github.com/dragonlabsdev/draco-daemon
mv draco-daemon node
cd node
npm install
cd node

#Prompt user for a configuration command or URL
read -p "Enter configuration: " configure

# If the input starts with http://, replace it with https://
if [[ $configure == http://* ]]; then
    configure="${configure/http:\/\//https://}"
fi

# Run the configuration command
$configure

# Start node
node .
'
