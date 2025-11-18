# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Mordor (A14)
auto eth0
iface eth0 inet static
    address 10.70.0.22
    netmask 255.255.255.252
    gateway 10.70.0.21

# [eth1] Interface ke Switch8 (A15)
auto eth1
iface eth1 inet static
    address 10.70.4.1
    netmask 255.255.254.0

# [eth2] Interface ke Switch9 (A16)
auto eth2
iface eth2 inet static
    address 10.70.6.1
    netmask 255.255.254.0

# Default route
post-up route add default gw 10.70.0.21

# IP Forwarding & RP Filter
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
post-up echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
