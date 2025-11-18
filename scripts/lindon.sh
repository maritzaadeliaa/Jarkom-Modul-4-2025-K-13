# !/bin/bash

# File: /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.70.2.30
    netmask 255.255.254.0
    gateway 10.70.2.1

post-up echo "nameserver 192.168.122.1" > /etc/resolv.conf
