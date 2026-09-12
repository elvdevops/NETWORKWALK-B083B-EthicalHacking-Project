# Ethical Hacking Lab

A hands-on cybersecurity laboratory built with Oracle VirtualBox and Kali Linux for learning ethical hacking, penetration testing, network security, and security testing in a controlled environment.

The lab provides an isolated virtual network where Kali Linux acts as the attacking machine while maintaining controlled outbound Internet access.

---

## Objectives

This project is designed to:

* Build a reproducible ethical hacking laboratory
* Deploy Kali Linux as an attacker machine
* Configure a dedicated VirtualBox NAT Network
* Use the `10.0.0.0/24` subnet
* Configure Kali Linux with a static IP of `10.0.0.2/24`
* Provide Kali Linux with Internet connectivity
* Enable VirtualBox clipboard integration
* Enable bidirectional drag-and-drop
* Configure a shared `/downloads` directory
* Verify the complete lab environment
* Establish a foundation for future penetration-testing exercises

---

## Lab Architecture

```text
                         INTERNET
                             │
                             │
                    ┌────────▼────────┐
                    │   VirtualBox    │
                    │   NAT Network   │
                    │                 │
                    │  10.0.0.0/24    │
                    └────────┬────────┘
                             │
                    ┌────────▼────────┐
                    │   Kali Linux    │
                    │    Attacker     │
                    │                 │
                    │ 10.0.0.2/24     │
                    │ Gateway .1       │
                    └────────┬────────┘
                             │
                      Shared Folder
                       /downloads
```

---

## Environment

| Component       | Configuration           |
| --------------- | ----------------------- |
| Hypervisor      | Oracle VirtualBox 7.2.x |
| Attacking OS    | Kali Linux              |
| Network Type    | NAT Network             |
| Network Name    | NatNetwork              |
| Network         | `10.0.0.0/24`           |
| Kali IP         | `10.0.0.2/24`           |
| Gateway         | `10.0.0.1`              |
| DNS             | `1.1.1.1 / 8.8.8.8`     |
| Internet Access | Enabled                 |
| Clipboard       | Bidirectional           |
| Drag & Drop     | Bidirectional           |
| Shared Folder   | `/downloads`            |

---

## Project Structure

```text
ethical-hacking-lab/
│
├── README.md
│
├── docs/
│   ├── architecture.md
│   ├── network-design.md
│   └── screenshots/
│       ├── virtualbox-settings.png
│       ├── nat-network.png
│       ├── kali-ip.png
│       ├── internet-test.png
│       ├── verify-lab.png
│       └── shared-folder.png
│
├── setup/
│   ├── network/
│   │   └── nat-network.md
│   │
│   ├── kali/
│   │   ├── installation.md
│   │   ├── networking.md
│   │   └── guest-additions.md
│   │
│   └── shared-folder.md
│
├── scripts/
│   └── verify-lab.sh
│
└── .gitignore
```

---

## Setup Guide

### 1. VirtualBox

Install Oracle VirtualBox and create the required NAT Network.

See:

* [NAT Network Configuration](setup/network/nat-network.md)
* [Network Design](docs/network-design.md)

### 2. Kali Linux

Deploy Kali Linux as the attacking machine.

See:

* [Kali Installation](setup/kali/installation.md)
* [Kali Networking](setup/kali/networking.md)
* [Guest Additions](setup/kali/guest-additions.md)

### 3. Shared Folder

Configure the host's `/downloads` directory as a VirtualBox shared folder.

See:

* [Shared Folder Configuration](setup/shared-folder.md)

---

## Verification

The project includes a verification script that checks the major components of the lab.

Run:

```bash
chmod +x scripts/verify-lab.sh
./scripts/verify-lab.sh
```

The script checks:

* IP address configuration
* Default gateway
* Gateway connectivity
* Internet connectivity
* DNS resolution
* HTTPS connectivity

---

## Screenshots

Evidence from the completed lab is stored in:

```text
docs/screenshots/
```

The documentation includes screenshots showing:

* VirtualBox VM configuration
* NAT Network configuration
* Kali Linux IP configuration
* Internet connectivity
* Shared folder configuration

---

## Security Scope

This laboratory is intended strictly for:

* Ethical hacking education
* Penetration-testing practice
* Cybersecurity experimentation
* Security research in controlled environments

All security testing should be performed only against systems that you own or have explicit authorization to test.

---

## Future Development

The lab will eventually be expanded with intentionally vulnerable target machines.

Planned activities include:

* Network reconnaissance
* Host discovery
* Port scanning
* Service enumeration
* Vulnerability assessment
* Web application security testing
* Traffic analysis
* Password security testing
* Exploitation in controlled environments
* Privilege escalation
* Post-exploitation analysis
* Security remediation
* Security documentation
* DevSecOps integration

---

## Learning Goals

The purpose of this project is not simply to learn cybersecurity tools.

The broader goal is to understand:

1. How networks are designed
2. How systems communicate
3. How attackers discover exposed services
4. How vulnerabilities are identified
5. How attacks can be detected
6. How vulnerabilities can be remediated
7. How security practices can be integrated into DevSecOps

---

## Disclaimer

This project is for educational and authorized security-testing purposes only.

Do not use the techniques, tools, or procedures documented in this repository against systems without explicit authorization.
