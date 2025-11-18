# !/bin/bash

# File: /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.70.2.10
    netmask 255.255.254.0
    gateway 10.70.2.1           # Gateway ke Valinor
    dns-nameservers 192.168.122.1 8.8.8.8

# Pastikan bisa ping gateway dulu
post-up ping -c 2 10.70.2.1
