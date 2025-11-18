# !/bin/bash

# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Amonsul (A17)
auto eth0
iface eth0 inet static
    address 10.70.0.26
    netmask 255.255.255.252
    gateway 10.70.0.25  # Gateway ke Amonsul

# [eth1] Interface ke Amroth (A18)
auto eth1
iface eth1 inet static
    address 10.70.0.29
    netmask 255.255.255.252

# [eth2] Interface ke Anor (A19)
auto eth2
iface eth2 inet static
    address 10.70.0.33
    netmask 255.255.255.252

# Routing ke Amroth downstream
post-up route add -net 10.70.0.48 netmask 255.255.255.248 gw 10.70.0.30  # A20 - Switch1
post-up route add -net 10.70.0.192 netmask 255.255.255.192 gw 10.70.0.30 # A21 - Switch2
post-up route add -net 10.70.0.56 netmask 255.255.255.248 gw 10.70.0.30  # A22 - Erebor

# Routing ke Anor downstream
post-up route add -net 10.70.1.20 netmask 255.255.252.0 gw 10.70.0.34    # A23 - Switch3

# Default route ke Amonsul
post-up route add default gw 10.70.0.25

# IP Forwarding
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
