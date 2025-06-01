#!/bin/bash

# Clone the repository
git clone https://github.com/achul123/skyportd.git

# Navigate into the cloned directory
cd skyportd

# Install npm dependencies
npm install

# Prompt user for a configuration command or URL
read -p "Enter configuration command or URL: " configure

# If the input starts with http://, replace it with https://
if [[ $configure == http://* ]]; then
    configure="${configure/http:\/\//https://}"
fi

# Run the configuration command or open the URL
$configure

# Start the app using PM2
pm2 start .
