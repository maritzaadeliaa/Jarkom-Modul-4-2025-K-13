# File: /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.70.1.10
    netmask 255.255.255.128
    gateway 10.70.1.1
    dns-nameservers 192.168.122.1 8.8.8.8
