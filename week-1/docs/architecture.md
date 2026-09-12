# Lab Architecture

## Overview

The Ethical Hacking Lab uses Oracle VirtualBox to provide an isolated virtualized environment for cybersecurity training.

Kali Linux serves as the attacking machine and is connected to a dedicated VirtualBox NAT Network using the `10.0.0.0/24` subnet.

The design provides communication within the laboratory network while allowing Kali Linux to access the Internet for legitimate security research, package installation, updates, and other authorized activities.

---

## Architecture Diagram

```text
                         INTERNET
                             │
                             │
                             ▼
                  ┌────────────────────┐
                  │     HOST MACHINE   │
                  │                    │
                  │      Windows       │
                  └─────────┬──────────┘
                            │
                     Oracle VirtualBox
                            │
                            ▼
                  ┌────────────────────┐
                  │    NatNetwork      │
                  │                    │
                  │   10.0.0.0/24      │
                  │                    │
                  │   Gateway: .1      │
                  └─────────┬──────────┘
                            │
                            │
                    ┌───────▼────────┐
                    │   Kali Linux   │
                    │                │
                    │    Attacker    │
                    │                │
                    │ 10.0.0.2/24    │
                    └───────┬────────┘
                            │
                            │
                     Shared Folder
                       /downloads
                            │
                            ▼
                     Host Downloads
```

---

## Components

### Host Machine

The host machine runs Ubuntu and provides the physical computing resources required by the virtual laboratory.

Resources include:

* CPU
* RAM
* Storage
* Internet connection
* VirtualBox

---

### Oracle VirtualBox

VirtualBox provides the virtualization layer used to run Kali Linux.

The VM is configured with:

* NAT Network connectivity
* Bidirectional clipboard
* Bidirectional drag-and-drop
* Shared folder support

---

### NAT Network

The dedicated NAT Network is named:

```text
NatNetwork
```

Network:

```text
10.0.0.0/24
```

Gateway:

```text
10.0.0.1
```

---

### Kali Linux

Kali Linux is the attacking and security-testing workstation.

Static configuration:

```text
IP Address: 10.0.0.2
Subnet:     /24
Gateway:    10.0.0.1
DNS:        1.1.1.1
```

Kali will later be used for authorized:

* Reconnaissance
* Enumeration
* Vulnerability assessment
* Web security testing
* Traffic analysis
* Exploitation exercises

---

## Design Principles

The laboratory follows several principles:

### Isolation

Security testing should occur inside a controlled environment rather than against unauthorized systems.

### Reproducibility

Configuration steps are documented so the environment can be recreated.

### Controlled Connectivity

The lab uses a dedicated NAT Network rather than directly exposing the virtual machine to the physical LAN.

### Evidence-Based Learning

Configuration and testing results are documented using screenshots, command output, and verification scripts.

---

## Future Architecture

The lab can later be expanded with intentionally vulnerable target systems:

```text
                         INTERNET
                             │
                             ▼
                       VirtualBox
                             │
                       EH-Lab-NAT
                      10.0.0.0/24
                             │
              ┌──────────────┼──────────────┐
              │              │              │
              ▼              ▼              ▼
        Kali Linux       Web Target      Windows Target
        10.0.0.2         10.0.0.10       10.0.0.20
        Attacker         Vulnerable       Vulnerable
```

This will allow controlled penetration-testing exercises against systems specifically deployed for the laboratory.
