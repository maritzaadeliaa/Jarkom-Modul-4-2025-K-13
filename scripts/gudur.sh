# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Numenor (A9)
auto eth0
iface eth0 inet satatic
    address 10.70.0.14
    netmask 255.255.255.252
    gateway 10.70.0.13

# [eth1] Interface ke Switch5 (A11)
auto eth1
iface eth1 inet static
    address 10.70.1.129
    netmask 255.255.255.128

# [eth2] Interface ke Switch6 (A12)
auto eth2
iface eth2 inet static
    address 10.70.0.65
    netmask 255.255.255.240

# Default route
post-up route add default gw 10.70.0.13

# IP Forwarding & RP Filter
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
post-up echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
