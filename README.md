# ThingsBoard PE - UFW Firewall Setup Script

This script automatically configures the firewall (`ufw`) for a server running ThingsBoard PE, including supporting services like PostgreSQL, Cassandra, Kafka, Zookeeper, MQTT, and CoAP.

It opens only the necessary ports to ensure secure access for users and IoT devices.

---

## ✨ What does the script do?

- Enables `ufw` if it is not already active.
- Opens the SSH port (`22/tcp`) to maintain administrative access.
- Opens ThingsBoard Web UI ports:
  - `80/tcp` (standard HTTP, useful for certbot or redirects)
  - `8080/tcp` (ThingsBoard Web UI over HTTP)
  - `443/tcp` (ThingsBoard Web UI over HTTPS)
- Opens MQTT ports:
  - `1883/tcp` (standard MQTT)
  - `8883/tcp` (MQTTs - secure MQTT over SSL/TLS)
- Opens CoAP ports:
  - `5683/udp` (CoAP)
  - `5684/udp` (CoAPs - secure CoAP over SSL/TLS)
- Sets firewall policies:
  - `deny incoming` — block all incoming connections except allowed ones,
  - `allow outgoing` — allow all outgoing connections.
- Displays the current `ufw` firewall status.

---

## 🚀 How to use

1. Save the script to a file:

    ```bash
    nano setup-ufw-thingsboard.sh
    ```

2. Make it executable:

    ```bash
    chmod +x setup-ufw-thingsboard.sh
    ```

3. Run the script:

    ```bash
    ./setup-ufw-thingsboard.sh
    ```

---

## 🔥 Required ports

| Service | Port | Protocol | Notes |
|:---|:---|:---|:---|
| SSH | 22/tcp | TCP | Maintain remote access to the server |
| HTTP | 80/tcp | TCP | Standard HTTP (redirects, Let's Encrypt) |
| ThingsBoard Web UI (HTTP) | 8080/tcp | TCP | Web UI without SSL |
| ThingsBoard Web UI (HTTPS) | 443/tcp | TCP | Web UI with SSL/TLS |
| MQTT Broker | 1883/tcp | TCP | IoT device communication |
| MQTTs Broker | 8883/tcp | TCP | Secure MQTT communication |
| CoAP | 5683/udp | UDP | Lightweight IoT protocol |
| CoAPs | 5684/udp | UDP | Secure CoAP communication |

**Other internal ports (e.g., PostgreSQL, Cassandra, Kafka, Zookeeper) remain accessible only locally and are not exposed to the public internet.**

---

## 📋 Notes

- **Always ensure** that SSH port (`22/tcp`) is open before enabling `ufw`, to avoid losing remote access.
- If you are not using MQTT or CoAP, you can skip opening ports `1883`, `8883`, `5683`, and `5684`.
- If you are using Let's Encrypt (`certbot`) for SSL certificates, opening `80/tcp` is required.
- This script assumes default ports and a standard ThingsBoard PE installation.
- For improved security, you may restrict Web UI access to specific trusted IP addresses (optional).

---

## 🛡️ Author

Inteliv - Automatyka Budynkowa
