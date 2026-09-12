# NAT Network Configuration

## Objective

Create a dedicated VirtualBox NAT Network for the Ethical Hacking Lab.

The network will use:

```text
Network: 10.0.0.0/24
Name:    NatNetwork
Gateway: 10.0.0.1
```

DHCP will be disabled because Kali Linux will use a manually assigned IP address.

---

## GUI Configuration

Open:

```text
VirtualBox
→ Tools
→ Network
→ NAT Networks
```

Create a new NAT Network.

Configure:

```text
Name:
NatNetwork

Network:
10.0.0.0/24

DHCP:
Disabled
```

Enable the network.

---

## CLI Configuration

The NAT Network can also be created using:

```bash
VBoxManage natnetwork add \
  --netname "NatNetwork" \
  --network "10.0.0.0/24" \
  --enable \
  --dhcp off
```

Verify:

```bash
VBoxManage natnetwork list
```

Expected configuration:

```text
Network Name: EH-Lab-NAT
Network:      10.0.0.0/24
DHCP:         Disabled
Enabled:      Yes
```

---

## Attach Kali Linux

Open:

```text
Kali Linux
→ Settings
→ Network
→ Adapter 1
```

Configure:

```text
Enable Network Adapter: Yes

Attached to:
NAT Network

Name:
NatNetwork
```

Save the configuration.

---

## Verification

Start Kali Linux and run:

```bash
ip addr
```

Then:

```bash
ip route
```

The machine should eventually show:

```text
10.0.0.2/24
```

and a default route through:

```text
10.0.0.1
```

---

## Troubleshooting

If the NAT Network does not appear:

```bash
VBoxManage natnetwork list
```

If it exists but is disabled:

```bash
VBoxManage natnetwork modify \
  --netname "NatNetwork" \
  --enable
```

Restart the Kali network connection after making changes.
