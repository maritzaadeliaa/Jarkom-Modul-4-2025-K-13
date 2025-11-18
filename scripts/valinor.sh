# !/bin/bash

# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Switch13
auto eth0
iface eth0 inet static
    address 10.70.0.42
    netmask 255.255.255.248
    gateway 10.70.0.41

# [eth1] Interface ke Switch10 (A3)
auto eth1
iface eth1 inet static
    address 10.70.2.1
    netmask 255.255.254.0
