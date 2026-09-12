# Network Design

## Network Overview

The Ethical Hacking Lab uses a dedicated VirtualBox NAT Network.

The network is based on:

```text
10.0.0.0/24
```

This provides 256 IPv4 addresses, with usable host addresses ranging from:

```text
10.0.0.1 - 10.0.0.254
```

---

## Network Configuration

| Parameter       | Value           |
| --------------- | --------------- |
| Network Name    | `EH-Lab-NAT`    |
| Network Address | `10.0.0.0/24`   |
| Subnet Mask     | `255.255.255.0` |
| Gateway         | `10.0.0.1`      |
| Kali Address    | `10.0.0.2`      |
| DNS             | `1.1.1.1`       |
| DHCP            | Disabled        |
| Network Type    | NAT Network     |

---

## Address Allocation

The initial laboratory allocation is:

```text
10.0.0.1       VirtualBox NAT Gateway
10.0.0.2       Kali Linux Attacker
10.0.0.10+     Future Target Machines
```

Additional addresses can be assigned as the laboratory expands.

---

## Why Use a NAT Network?

A VirtualBox NAT Network provides a useful balance between isolation and connectivity.

The Kali machine can:

* Communicate with other VMs attached to the same NAT Network
* Access the Internet
* Download packages and updates
* Perform authorized external connectivity tests

At the same time, the lab remains separated from the host's physical LAN.

---

## Traffic Flow

Outbound traffic follows this general path:

```text
Kali Linux
10.0.0.2
     │
     ▼
VirtualBox NAT Gateway
10.0.0.1
     │
     ▼
Host Network
     │
     ▼
Internet
```

Communication between laboratory machines remains within the virtual network:

```text
Kali
10.0.0.2
   │
   │
   ▼
10.0.0.10
Target
```

---

## Verification Commands

Check the Kali address:

```bash
ip addr
```

Check routing:

```bash
ip route
```

Test the gateway:

```bash
ping -c 4 10.0.0.1
```

Test Internet connectivity:

```bash
ping -c 4 1.1.1.1
```

Test DNS:

```bash
ping -c 4 google.com
```

Test HTTPS:

```bash
curl -I https://www.kali.org
```

---

## Network Security Considerations

The lab is intended for authorized security testing.

The network should not be used to attack systems outside the laboratory without explicit authorization.

Future target systems should be intentionally vulnerable machines designed for security training.

---

## Future Network Expansion

As the project grows, the network can include:

```text
10.0.0.2       Kali Linux
10.0.0.10      Vulnerable Web Server
10.0.0.20      Vulnerable Linux Server
10.0.0.30      Vulnerable Windows Machine
10.0.0.40      Monitoring/SIEM
```

This will allow more advanced exercises involving:

* Network discovery
* Enumeration
* Exploitation
* Lateral movement
* Detection
* Incident analysis
* Remediation
