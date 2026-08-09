# Task 8 - Network Traffic Analysis with Wireshark

## Objective

The objective of this task is to capture and analyze network traffic using Wireshark. The analysis focuses on identifying common network protocols, examining HTTP and DNS traffic, understanding TCP communication, identifying the TCP three-way handshake, and observing the security risks associated with unencrypted HTTP traffic.

The network traffic was captured from the local system using Wireshark on the Wi-Fi network interface. The captured traffic was analyzed in a controlled environment for educational and cybersecurity learning purposes.

---

## Tools Used

- Windows 11
- Wireshark 4.6.7
- Wi-Fi Network Interface
- Web Browser
- Wireshark Display Filters

---

## What is Wireshark?

Wireshark is an open-source network protocol analyzer used to capture and inspect network traffic. It allows security professionals and network administrators to examine packets, identify protocols, troubleshoot network communication, and investigate potential security issues.

Wireshark provides detailed information about individual packets, including source and destination addresses, protocols, ports, packet lengths, and protocol-specific data.

---

## Environment

The testing environment consisted of:

- Windows operating system
- Wireshark 4.6.7
- Active Wi-Fi network connection
- Web browser for generating normal network traffic

The traffic was captured from the Wi-Fi interface available on the local system.

---

## Capture File

The network traffic was saved as a Wireshark capture file:

```text
wireshark_capture.pcapng
```
The capture contains approximately two minutes of network traffic and was used for the protocol analysis performed in this task.

## Wireshark Installation

Wireshark 4.6.7 was installed on the Windows system for network traffic analysis.

### Installation Process

1. Wireshark was downloaded from the official Wireshark website.
2. The Windows installer was executed and the default installation options were selected.
3. During installation, **Npcap** was installed because it is required for capturing live network traffic.
4. After installation, Wireshark was launched from the Windows Start menu.
5. The installed version was verified as **Wireshark 4.6.7**.

Wireshark was then ready to capture network traffic from the available Wi-Fi interface.

---

## Network Traffic Capture

Wireshark was used to capture live network traffic from the system's Wi-Fi interface.

The capture was allowed to run for more than two minutes while normal network activity was generated. This provided sufficient packets for protocol analysis.

### Capture Process

1. Wireshark was opened and the active **Wi-Fi** interface was selected.
2. The capture was started using the Wireshark capture controls.
3. Normal network activity was generated during the capture period.
4. The capture was allowed to continue for more than two minutes.
5. The capture was stopped after sufficient traffic was collected.
6. The captured traffic was saved for further analysis.

The resulting capture file was:

```text
wireshark_capture.pcapng
```

The saved capture file was then reopened in Wireshark to perform the protocol analysis.

## HTTP Traffic Analysis

The `http` display filter was applied in Wireshark to isolate HTTP traffic from the captured packets.

The filter used was:

```text
http
```

The analysis identified HTTP requests and responses, including:

```text
GET / HTTP/1.1
GET /favicon.ico
HTTP/1.1 200 OK
```

The HTTP traffic was observed on port 80, which is the standard port used by HTTP.

A packet containing an HTTP GET request was selected for further inspection. The packet details showed readable HTTP information such as the requested host, request method, and user-agent information.

This demonstrates that HTTP communication can expose application-layer information in readable form when encryption is not used.

## Screenshot

The HTTP traffic analysis is demonstrated in:

```text
screenshots/http_filter.png
```
## DNS Traffic Analysis

The `dns` display filter was applied in Wireshark to isolate DNS traffic from the captured packets.

The filter used was:

```text
dns
```

The analysis identified DNS queries and responses generated during normal network activity.

Examples of observed DNS traffic included queries related to:

```text
search.brave.com
neverssl.com
cloudflare.com
```

The captured DNS packets included both Standard query and Standard query response messages.

DNS commonly uses port 53 for communication. The captured traffic demonstrated how DNS is used to resolve domain names into network addresses before establishing connections with remote services.

## Screenshot

The DNS traffic analysis is demonstrated in:

```text
screenshots/dns_filter.png
```
## TCP Traffic Analysis

The `tcp` display filter was applied in Wireshark to isolate TCP traffic from the captured packets.

The filter used was:

```text
tcp
```
TCP packets were examined to understand how a connection is established between a client and a server.

TCP Three-Way Handshake

A complete TCP three-way handshake was identified in the captured traffic.

The handshake consisted of the following sequence:

- SYN — The client sends a SYN packet to request a TCP connection.
- SYN-ACK — The server responds with a SYN-ACK packet to acknowledge the request.
- ACK — The client sends an ACK packet to complete the connection establishment.

The observed packet sequence demonstrated the normal TCP connection establishment process.

## Screenshot

The TCP traffic and three-way handshake are demonstrated in:

```text
screenshots/tcp_handshake.png
```

## Unencrypted HTTP Traffic

An HTTP GET request was selected from the captured traffic for detailed packet analysis.

The packet contained readable HTTP information, including:

- HTTP request method: `GET`
- Requested host: `neverssl.com`
- Connection information
- User-Agent information

Because HTTP does not encrypt the application data, information transmitted using HTTP can potentially be viewed by an attacker who is able to capture the network traffic.

This demonstrates the security risk of transmitting sensitive information over unencrypted HTTP connections.

### Screenshot

The plaintext HTTP request is demonstrated in:

```text
screenshots/http_plaintext.png
```

## Why Unencrypted HTTP is Dangerous

HTTP transmits application data without encryption. This means that an attacker who is able to monitor the network traffic may be able to read information contained in HTTP requests and responses.

For example, the captured HTTP GET request allowed readable information such as the requested host and User-Agent to be observed directly in Wireshark.

If sensitive information such as login credentials, session information, or personal data were transmitted over HTTP, that information could potentially be exposed to network eavesdropping.

### How HTTPS Provides Protection

HTTPS uses encryption through TLS to protect communication between a client and a web server.

Unlike ordinary HTTP traffic, HTTPS encrypts the application data exchanged between the client and server. This makes it significantly more difficult for someone monitoring the network to read the actual contents of the communication.

Therefore, sensitive information should be transmitted using HTTPS rather than unencrypted HTTP.

---

## Protocol Hierarchy Analysis

Wireshark's Protocol Hierarchy feature was used to obtain an overview of the protocols present in the captured network traffic.

The Protocol Hierarchy analysis provided a summary of the different protocol layers and their contribution to the captured traffic.

The captured traffic included protocols such as:

- Ethernet
- IPv4
- TCP
- UDP
- DNS
- TLS
- HTTP
- QUIC

This analysis helped provide an overall understanding of the types of network communication present during the capture.

### Screenshot

The protocol distribution and hierarchy are demonstrated in:

```text
screenshots/protocol_hierarchy.png
```

## Security Observations

The network traffic analysis provided several useful security observations.

### 1. Unencrypted HTTP Traffic

HTTP traffic was observed in readable form during packet analysis. Since HTTP does not provide encryption, application-layer information can potentially be exposed to an attacker monitoring the network.

**Recommendation:** Use HTTPS instead of HTTP for web communication, especially when transmitting sensitive information.

### 2. DNS Traffic

DNS queries and responses were observed during the capture. DNS is required for resolving domain names, but traditional DNS traffic may not provide encryption by itself.

**Recommendation:** Where appropriate, use secure DNS technologies such as DNS over HTTPS (DoH) or DNS over TLS (DoT).

### 3. TCP Connection Establishment

The TCP three-way handshake was successfully identified using the sequence:

```text
SYN → SYN-ACK → ACK
```
his demonstrates the normal process used to establish a reliable TCP connection.

### 4. Protocol Visibility

Wireshark made it possible to identify different protocols and inspect their packet-level characteristics.

This demonstrates the importance of network monitoring and packet analysis for identifying unexpected or insecure communication.

## Security Recommendations

Based on the network traffic analysis, the following security practices are recommended:

1. **Use HTTPS instead of HTTP**
   
   Websites and applications should use HTTPS to encrypt data exchanged between clients and servers.

2. **Avoid transmitting sensitive information over HTTP**
   
   Passwords, authentication tokens, personal information, and other sensitive data should never be transmitted through unencrypted HTTP connections.

3. **Use secure DNS where appropriate**
   
   DNS over HTTPS (DoH) or DNS over TLS (DoT) can be used to provide additional privacy for DNS queries.

4. **Monitor network traffic**
   
   Regular packet analysis can help identify unexpected connections, unusual protocols, and potentially insecure communication.

5. **Use network encryption**
   
   Encryption should be used wherever sensitive information is transmitted across a network.

6. **Maintain secure network configurations**
   
   Network devices, operating systems, and security tools should be kept updated and configured according to security best practices.

---

## Conclusion

The Wireshark analysis provided practical experience in capturing and examining network traffic.

The analysis successfully identified HTTP and DNS traffic, examined TCP communication, and demonstrated a TCP three-way handshake using the `SYN`, `SYN-ACK`, and `ACK` sequence.

The analysis also demonstrated the security risk of unencrypted HTTP by showing that HTTP request information can be viewed in readable form within captured packets.

This task provided practical knowledge of packet analysis, network protocols, and the importance of encrypted communication in cybersecurity.

## Screenshots and Evidence

The following screenshots were captured during the network traffic analysis and are included as supporting evidence for the task.

### HTTP Traffic

The `http` filter was used to identify HTTP requests and responses in the captured traffic.

```text
screenshots/http_filter.png
```
### DNS Traffic

The `dns` filter was used to identify DNS queries and responses.

```text
screenshots/dns_filter.png
TCP Three-Way Handshake

```
The TCP analysis demonstrated the three-way handshake using the `SYN, SYN-ACK,` and `ACK` sequence.

```text
screenshots/tcp_handshake.png
```

### Plaintext HTTP Traffic

A captured HTTP GET request was inspected to demonstrate that HTTP application data can be viewed in readable form.

```text
screenshots/http_plaintext.png
```

### Protocol Hierarchy

The Protocol Hierarchy feature was used to obtain an overview of the protocols present in the capture.
```text
screenshots/protocol_hierarchy.png
```

## Capture File

The complete network traffic capture was saved using Wireshark for further analysis and reproducibility.

The capture file is:

```text
wireshark_capture.pcapng
```

This file contains the packets collected during the live network capture and was used to perform the HTTP, DNS, TCP, and protocol hierarchy analysis documented in this project.

The capture file is included in the project repository along with the screenshots and documentation.

## Glossary

### Packet

A packet is a small unit of data transmitted across a network. It contains information that helps deliver the data from the source to the destination.

### Protocol

A protocol is a set of rules that defines how devices communicate and exchange data over a network.

### Port

A port is a logical communication endpoint used to identify a particular network service or application. For example, HTTP commonly uses port 80 and DNS commonly uses port 53.

### Payload

The payload is the actual data carried inside a network packet after the protocol information used for communication is accounted for.

### Handshake

A handshake is a sequence of messages exchanged between network devices to establish or negotiate a connection. In TCP, the connection is established using the SYN, SYN-ACK, and ACK sequence.

---

## Ethical Considerations

This network traffic analysis was performed on the local system using a controlled environment for educational and cybersecurity learning purposes.

Only traffic generated by the authorized local system and network connection was analyzed.

Network monitoring and packet capture should only be performed on systems and networks for which proper authorization has been obtained. Capturing traffic without permission may expose sensitive information and may violate privacy, organizational policies, or applicable laws.

---

## Conclusion

The Wireshark network traffic analysis task was successfully completed.

The captured traffic was analyzed using Wireshark display filters to identify HTTP, DNS, and TCP communication. A TCP three-way handshake was successfully identified using the SYN, SYN-ACK, and ACK sequence.

The analysis also demonstrated the security risks associated with unencrypted HTTP traffic by showing that HTTP request information can be viewed in readable form within captured packets.

The task provided practical experience in network packet capture, protocol identification, traffic analysis, TCP connection establishment, and understanding the importance of encrypted network communication.

---
