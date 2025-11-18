# !/bin/bash

auto eth0
iface eth0 inet static
    address 10.70.0.70
    netmask 255.255.255.240
    gateway 10.70.0.65
    dns-nameservers 192.168.122.1 8.8.8.8
