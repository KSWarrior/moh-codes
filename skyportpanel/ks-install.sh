#!/bin/bash

echo "Choose an option:"
echo "1) Install Panel"
echo "2) Install Wings"
echo "3) Install Both Panel & Wings"
read -p "Enter your choice [1-3]: " choice

case $choice in
    1)
        echo "Installing Panel..."
        bash <(curl -sSL https://example.com/install-panel.sh)
        ;;
    2)
        echo "Installing Wings..."
        bash <(curl -sSL https://example.com/install-wings.sh)
        ;;
    3)
        echo "Installing Panel..."
        bash <(curl -sSL https://example.com/install-panel.sh)
        echo "Installing Wings..."
        bash <(curl -sSL https://example.com/install-wings.sh)
        ;;
    *)
        echo "Invalid option. Please enter 1, 2, or 3."
        ;;
esac
