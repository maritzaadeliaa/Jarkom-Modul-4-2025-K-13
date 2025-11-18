# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Eregion (A8)
auto eth0
iface eth0 inet static
    address 10.70.0.10
    netmask 255.255.255.252
    gateway 10.70.0.9

# [eth1] Interface ke Switch7 (A13)
auto eth1
iface eth1 inet static
    address 10.70.0.1
    netmask 255.255.252.0

# [eth2] Interface ke Gudur (A9)
auto eth2
iface eth2 inet static
    address 10.70.0.13
    netmask 255.255.255.252

# [eth3] Interface ke Mordor (A10)
auto eth3
iface eth3 inet static
    address 10.70.0.17
    netmask 255.255.255.252

# Routing ke Gudur downstream
post-up route add -net 10.70.1.128 netmask 255.255.255.128 gw 10.70.0.14  # A11
post-up route add -net 10.70.0.64 netmask 255.255.255.240 gw 10.70.0.14   # A12

# Routing ke Mordor downstream
post-up route add -net 10.70.0.20 netmask 255.255.255.252 gw 10.70.0.18   # A14
post-up route add -net 10.70.4.0 netmask 255.255.254.0 gw 10.70.0.18      # A15
post-up route add -net 10.70.6.0 netmask 255.255.254.0 gw 10.70.0.18      # A16

# Default route
post-up route add default gw 10.70.0.9

# IP Forwarding & RP Filter
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
post-up echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
