# !/bin/bash

auto eth0
iface eth0 inet static
    address 10.70.6.10
    netmask 255.255.254.0
    gateway 10.70.6.1
    dns-nameservers 192.168.122.1 8.8.8.8
