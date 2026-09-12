#!/bin/bash

echo "=============================================="
echo "       Ethical Hacking Lab Verification"
echo "=============================================="

echo
echo "[1] Network Interface"
echo "----------------------------------------------"
ip -4 addr

echo
echo "[2] Routing Table"
echo "----------------------------------------------"
ip route

echo
echo "[3] Testing VirtualBox NAT Gateway"
echo "----------------------------------------------"

if ping -c 2 -W 2 10.0.0.1 > /dev/null 2>&1; then
    echo "PASS: Gateway 10.0.0.1 is reachable"
else
    echo "FAIL: Gateway 10.0.0.1 is unreachable"
fi

echo
echo "[4] Testing Internet Connectivity"
echo "----------------------------------------------"

if ping -c 2 -W 3 1.1.1.1 > /dev/null 2>&1; then
    echo "PASS: Internet connectivity available"
else
    echo "FAIL: Internet connectivity unavailable"
fi

echo
echo "[5] Testing DNS Resolution"
echo "----------------------------------------------"

if getent hosts google.com > /dev/null 2>&1; then
    echo "PASS: DNS resolution working"
else
    echo "FAIL: DNS resolution failed"
fi

echo
echo "[6] Testing HTTPS Connectivity"
echo "----------------------------------------------"

if curl -Is --max-time 10 https://www.kali.org > /dev/null 2>&1; then
    echo "PASS: HTTPS connectivity working"
else
    echo "FAIL: HTTPS connectivity failed"
fi

echo
echo "[7] Testing Kali IP"
echo "----------------------------------------------"

if ip -4 addr | grep -q "10.0.0.2/24"; then
    echo "PASS: Kali IP 10.0.0.2/24 configured"
else
    echo "FAIL: Kali IP 10.0.0.2/24 not detected"
fi

echo
echo "[8] Testing Shared Folder"
echo "----------------------------------------------"

if [ -d "/media/sf_downloads" ]; then
    echo "PASS: /media/sf_downloads exists"
else
    echo "WARNING: Shared folder /media/sf_downloads not detected"
fi

echo
echo "=============================================="
echo "             Verification Complete"
echo "=============================================="
