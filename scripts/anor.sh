# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Minastir (A19)
auto eth0
iface eth0 inet static
    address 10.70.0.34
    netmask 255.255.255.252
    gateway 10.70.0.33  # Gateway ke Minastir

# [eth1] Interface ke Switch3 (A23)
auto eth1
iface eth1 inet static
    address 10.70.1.21
    netmask 255.255.252.0

# Default route ke Minastir
post-up route add default gw 10.70.0.33

# IP Forwarding
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
