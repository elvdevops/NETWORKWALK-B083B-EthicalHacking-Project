# Kali Linux Networking

## Objective

Configure Kali Linux with a static IPv4 address on the Ethical Hacking Lab network.

Target configuration:

```text
IP Address: 10.0.0.2/24
Gateway:    10.0.0.1
DNS:        1.1.1.1
```

---

## Identify the Network Connection

Run:

```bash
nmcli connection show
```

Example:

```text
NAME                TYPE      DEVICE
Wired connection 1  ethernet  eth0
```

The connection name may be different on your installation.

---

## Configure the Static Address

Replace `Wired connection 1` with the actual connection name if necessary:

```bash
sudo nmcli connection modify "Wired connection 1" \
  ipv4.method manual \
  ipv4.addresses 10.0.0.2/24 \
  ipv4.gateway 10.0.0.1 \
  ipv4.dns "1.1.1.1 8.8.8.8"
```

Restart the connection:

```bash
sudo nmcli connection down "Wired connection 1"
```

Then:

```bash
sudo nmcli connection up "Wired connection 1"
```

---

## Verify IP Address

Run:

```bash
ip addr
```

The interface should contain:

```text
10.0.0.2/24
```

---

## Verify Routing

Run:

```bash
ip route
```

Expected:

```text
default via 10.0.0.1
10.0.0.0/24 dev eth0
```

The interface name may differ.

---

## Test Gateway

```bash
ping -c 4 10.0.0.1
```

---

## Test Internet

```bash
ping -c 4 1.1.1.1
```

---

## Test DNS

```bash
ping -c 4 google.com
```

---

## Test HTTPS

```bash
curl -I https://www.kali.org
```

---

## Expected Configuration

```text
Kali Linux
    │
    ├── IP:      10.0.0.2/24
    ├── Gateway: 10.0.0.1
    └── DNS:     1.1.1.1 / 8.8.8.8
```

---

## Troubleshooting

If Internet access fails, inspect:

```bash
ip addr
ip route
resolvectl status
```

Check the gateway:

```bash
ping -c 4 10.0.0.1
```

Check Internet without DNS:

```bash
ping -c 4 1.1.1.1
```

If `1.1.1.1` works but `google.com` does not, the problem is likely DNS configuration.
