#!/bin/bash

echo "========== INSTALL.SH: Starting post-install configuration =========="

# Exit immediately if a command fails
set -e

# Update packages (for Ubuntu/Debian-based systems)
echo "Updating packages..."
apt update -y

# Install Apache2 if not already installed
echo "Checking if Apache is installed..."
if ! command -v apache2 >/dev/null 2>&1; then
    echo "Installing Apache..."
    apt install apache2 -y
fi

# Ensure Apache is started
echo "Starting Apache..."
systemctl start apache2

# Enable Apache to start on boot
echo "Enabling Apache to start on boot..."
systemctl enable apache2

# Set correct permissions
echo "Setting permissions for /var/www/html..."
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

echo "========== INSTALL.SH: Completed successfully =========="
