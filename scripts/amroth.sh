# !/bin/bash

# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Minastir (A18)
auto eth0
iface eth0 inet static
    address 10.70.0.30
    netmask 255.255.255.252
    gateway 10.70.0.29  # Gateway ke Minastir

# [eth1] Interface ke Switch1 (A20)
auto eth1
iface eth1 inet static
    address 10.70.0.49
    netmask 255.255.255.248

# Default route ke Minastir
post-up route add default gw 10.70.0.29

# IP Forwarding
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
