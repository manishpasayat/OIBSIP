# Basic Network Scanning with Nmap

## Objective

The objective of this project is to perform basic network reconnaissance using Nmap to identify active hosts, open ports, running services, and the operating system of a target machine. This project also analyzes the security implications of the discovered services and demonstrates the ethical use of network scanning tools.

---

## What is Nmap?

Nmap (Network Mapper) is an open-source network scanning and security auditing tool. It is widely used by system administrators, network engineers, and cybersecurity professionals to discover devices on a network, identify open ports, detect running services, perform operating system detection, and assess the security posture of a system.

---

## Why Network Scanning Matters

Network scanning is an important step in cybersecurity because it helps identify exposed services and potential attack surfaces. By knowing which ports are open and which services are running, administrators can detect unnecessary services, reduce security risks, and strengthen the overall security of a system.

---

## Tools Used

- Nmap 7.99
- Windows 11
- Command Prompt (PowerShell or CMD)

---

## Installation

1. Download Nmap from the official website:
   https://nmap.org/download.html

2. Run the installer and follow the default installation steps.

3. Install Npcap when prompted.

4. Verify the installation using:

```bash
nmap --version
```

---

## Commands Used

### Basic Scan

```bash
nmap 127.0.0.1
```

Purpose:
Scans the target machine and identifies open ports.

---

### Service Version Detection

```bash
nmap -sV 127.0.0.1
```

Purpose:
Identifies the services and their versions running on the open ports.

---

### Operating System Detection

```bash
nmap -O 127.0.0.1
```

Purpose:
Attempts to identify the operating system of the target machine.

---

### Aggressive Scan

```bash
nmap -A 127.0.0.1
```
Purspose:
Enables comprehensive scanning options in a single command , including OS detection (`-O`) , service version detection (`-sV`) , default script scanning (`-sC`) , and traceroute.

---

### No-Ping Scan(Skip host discovery)

```bash
nmap -Pn 127.0.0.1
```

Purpose:
Treats all target hosts as online and completely skips the initial host discovery (ping) phase . This allows you to scan targets protected by firewalls that block ICMP ping requests.

---

### Port Scan

```bash
nmap -p 443 127.0.0.1
```

Purpose:
Scans Specific target ports or port ranges to scan instead of the default top 1000 ports .

---

## Findings

The scan identified several open ports running different services. Each discovered service was analyzed to understand its purpose and possible security implications. Detailed results are available in **nmap_scan_results.txt**.

---

## Ethical Use

Nmap should only be used on systems that you own or have explicit permission to scan. Unauthorized scanning of third-party systems may violate laws, organizational policies, or terms of service. This project was performed only on a local machine for educational purposes.

---

## Project Structure

```
CyberSecurity-Task1-BasicNetworkScanning/

README.md
nmap_scan_results.txt
commands_used.txt
screenshots/
```

---

## Screenshots

Screenshots of the Nmap scans have been included in the **screenshots** folder.

---

## Author

**Manish Kumar Pasayat**

