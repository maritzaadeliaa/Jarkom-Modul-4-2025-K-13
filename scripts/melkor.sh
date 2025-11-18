# File: /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.70.4.10
    netmask 255.255.254.0
    gateway 10.70.4.1           # Gateway ke Erain
    dns-nameservers 192.168.122.1 8.8.8.8
