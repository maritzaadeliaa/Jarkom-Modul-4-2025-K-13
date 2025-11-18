# !/bin/bash

# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Switch13
auto eth0
iface eth0 inet static
    address 10.70.0.43
    netmask 255.255.255.248
    gateway 10.70.0.41

# [eth1] Interface ke Switch12 (A4)
auto eth1
iface eth1 inet static
    address 10.70.0.97
    netmask 255.255.255.224

# [eth2] Interface ke Switch11 (A5)
auto eth2
iface eth2 inet static
    address 10.70.0.129
    netmask 255.255.255.192
