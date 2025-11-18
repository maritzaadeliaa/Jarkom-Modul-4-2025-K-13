# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Numenor (A10)
auto eth0
iface eth0 inet static
    address 10.70.0.18
    netmask 255.255.255.252
    gateway 10.70.0.17

# [eth1] Interface ke Erain (A14)
auto eth1
iface eth1 inet static
    address 10.70.0.21
    netmask 255.255.255.252

# Default route
post-up route add default gw 10.70.0.17

# IP Forwarding & RP Filter
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
post-up echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
