# Basic Firewall Configuration with UFW

## Objective

The objective of this project is to configure a basic firewall on a Linux system using UFW (Uncomplicated Firewall). The firewall is configured to allow only necessary network traffic while blocking insecure or unnecessary traffic.

---

## What is UFW?

UFW (Uncomplicated Firewall) is a command-line firewall management tool for Linux. It provides a simple interface for configuring firewall rules and helps protect systems from unauthorized network access.

---

## Why Firewalls are Important

A firewall acts as a security barrier between a computer and the network. It monitors incoming and outgoing traffic and allows or blocks connections based on predefined security rules. Firewalls reduce the attack surface of a system and improve overall network security.

---

## Firewall Rules Configured

### 1. Allow SSH (Port 22)

Command:
```bash
sudo ufw allow ssh
```

Purpose:
Allows secure remote login using SSH.

---

### 2. Deny HTTP (Port 80)

Command:
```bash
sudo ufw deny http
```

Purpose:
Blocks unencrypted HTTP traffic.

---

### 3. Allow HTTPS (Port 443)

Command:
```bash
sudo ufw allow https
```

Purpose:
Allows secure encrypted web traffic.

---

### 4. Deny Telnet (Port 23)

Command:
```bash
sudo ufw deny 23
```

Purpose:
Blocks the Telnet service because it sends data without encryption and is considered insecure.

---

## Verification

Firewall rules were verified using:

```bash
sudo ufw status verbose
```

The output confirmed that all configured rules were successfully applied.

---

## Project Files

- README.md
- testing_method.txt
- ufw_configuration.sh
- screenshots/

---

## Ethical Use

Firewall configurations should only be applied on systems that you own or have permission to administer.

---

## Author

**Manish Kumar Pasayat**
