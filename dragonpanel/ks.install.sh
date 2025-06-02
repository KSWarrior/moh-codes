#!/bin/bash

echo "Choose an option:"
echo "1) Install Panel"
echo "2) Install Wings"
read -p "Enter your choice [1-2]: " choice

case $choice in
    1)
        echo "Installing Panel..."
        bash <(curl -sSL https://raw.githubusercontent.com/KSWarrior/moh-codes/refs/heads/main/dragonpanel/panel.sh)
        ;;
    2)
        echo "Installing Wings..."
        bash <(curl -sSL https://raw.githubusercontent.com/KSWarrior/moh-codes/refs/heads/main/dragonpanel/wings.sh)
        ;;
    *)
        echo "Invalid option. Please enter 1, 2, or 3."
        ;;
esac
