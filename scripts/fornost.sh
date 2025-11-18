# !/bin/bash

# File: /etc/network/interfaces di FORNOST
auto lo
iface lo inet loopback

# [eth0] Interface ke Switch13 (A2)
auto eth0
iface eth0 inet static
    address 10.70.0.41
    netmask 255.255.255.248

# [eth1] Interface ke Amonsul (A1)
auto eth1
iface eth1 inet static
    address 10.70.0.2
    netmask 255.255.255.252
    gateway 10.70.0.1

# ROUTING KE DOWNSTREAM 
post-up route add -net 10.70.2.0 netmask 255.255.254.0 gw 10.70.0.42    # A3 - Valinor
post-up route add -net 10.70.0.96 netmask 255.255.255.224 gw 10.70.0.43 # A4 - Valmar
post-up route add -net 10.70.0.128 netmask 255.255.255.192 gw 10.70.0.43 # A5 - Valmar

# IP forwarding
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
