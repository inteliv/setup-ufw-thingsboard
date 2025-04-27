#!/bin/bash

echo "🔒 Configuring UFW Firewall for ThingsBoard PE..."

# Enable UFW if it is not active
sudo ufw status | grep -qw inactive && {
    echo "➡️  UFW is inactive. Enabling firewall..."
    sudo ufw enable
}

# Always allow SSH access (port 22) to avoid locking yourself out
echo "➡️  Allowing port 22/tcp (SSH - administrative access)"
sudo ufw allow 22/tcp

# Allow HTTP (port 80) - standard web traffic, useful for Let's Encrypt or HTTP to HTTPS redirects
echo "➡️  Allowing port 80/tcp (HTTP)"
sudo ufw allow 80/tcp

# Allow ThingsBoard Web UI access over HTTP
echo "➡️  Allowing port 8080/tcp (ThingsBoard Web UI over HTTP)"
sudo ufw allow 8080/tcp

# Allow ThingsBoard Web UI access over HTTPS
echo "➡️  Allowing port 443/tcp (ThingsBoard Web UI over HTTPS)"
sudo ufw allow 443/tcp

# Allow MQTT Broker (standard MQTT communication)
echo "➡️  Allowing port 1883/tcp (MQTT Broker)"
sudo ufw allow 1883/tcp

# Allow MQTTs Broker (secure MQTT over SSL/TLS)
echo "➡️  Allowing port 8883/tcp (MQTTs Broker)"
sudo ufw allow 8883/tcp

# Allow CoAP (Lightweight IoT Protocol)
echo "➡️  Allowing port 5683/udp (CoAP)"
sudo ufw allow 5683/udp

# Allow CoAPs (Secure CoAP over SSL/TLS)
echo "➡️  Allowing port 5684/udp (CoAPs)"
sudo ufw allow 5684/udp

# Set default UFW policies: deny incoming traffic, allow outgoing traffic
echo "➡️  Setting default policies: deny incoming, allow outgoing"
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Display current UFW rules and status
echo "✅ Current UFW status:"
sudo ufw status verbose

echo "🎯 Firewall configuration for ThingsBoard PE completed successfully!"

