# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Switch4 (A7)
auto eth0
iface eth0 inet static
    address 10.70.1.1
    netmask 255.255.255.128

# [eth1] Interface ke Amonsul (A6)
auto eth1
iface eth1 inet static
    address 10.70.0.6
    netmask 255.255.255.252
    gateway 10.70.0.5

# [eth2] Interface ke Numenor (A8)
auto eth2
iface eth2 inet static
    address 10.70.0.9
    netmask 255.255.255.252

# Routing ke Numenor downstream
post-up route add -net 10.70.0.12 netmask 255.255.255.252 gw 10.70.0.10   # A9 - Gudur
post-up route add -net 10.70.0.16 netmask 255.255.255.252 gw 10.70.0.10   # A10 - Mordor
post-up route add -net 10.70.0.0 netmask 255.255.252.0 gw 10.70.0.10      # A13 - Switch7
post-up route add -net 10.70.1.128 netmask 255.255.255.128 gw 10.70.0.10  # A11 - Switch5
post-up route add -net 10.70.0.64 netmask 255.255.255.240 gw 10.70.0.10   # A12 - Switch6
post-up route add -net 10.70.0.20 netmask 255.255.255.252 gw 10.70.0.10   # A14 - Erain
post-up route add -net 10.70.4.0 netmask 255.255.254.0 gw 10.70.0.10      # A15 - Switch8
post-up route add -net 10.70.6.0 netmask 255.255.254.0 gw 10.70.0.10      # A16 - Switch9

# Default route
post-up route add default gw 10.70.0.5

# IP Forwarding & RP Filter
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
post-up echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
