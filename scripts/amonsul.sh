# !/bin/bash

# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke NAT (Internet)
auto eth0
iface eth0 inet dhcp

# [eth1] Interface ke Fornost (A1)
auto eth1
iface eth1 inet static
    address 10.70.0.1
    netmask 255.255.255.252

# [eth2] Interface ke Minastir (A17)
auto eth2
iface eth2 inet static
    address 10.70.0.25
    netmask 255.255.255.252

# [eth3] Interface ke Eregion (A6)
auto eth3
iface eth3 inet static
    address 10.70.0.5
    netmask 255.255.255.252

# Routing ke semua subnet
post-up ip route add 10.70.0.40/29 via 10.70.0.2      # A2 - Switch13
post-up ip route add 10.70.2.0/23 via 10.70.0.2       # A3 - Valinor > Switch10
post-up ip route add 10.70.0.96/27 via 10.70.0.2      # A4 - Valmar > Switch12
post-up ip route add 10.70.0.128/26 via 10.70.0.2     # A5 - Valmar > Switch11

# Routing ke Minastir downstream (tambahkan ini jika belum ada)
post-up route add -net 10.70.0.28 netmask 255.255.255.252 gw 10.70.0.26   # A18
post-up route add -net 10.70.0.32 netmask 255.255.255.252 gw 10.70.0.26   # A19
post-up route add -net 10.70.0.48 netmask 255.255.255.248 gw 10.70.0.26   # A20
post-up route add -net 10.70.0.56 netmask 255.255.255.248 gw 10.70.0.26   # A22
post-up route add -net 10.70.0.192 netmask 255.255.255.192 gw 10.70.0.26  # A21
post-up route add -net 10.70.1.20 netmask 255.255.252.0 gw 10.70.0.26     # A23

# Routing ke Eregion downstream (PASTIKAN INI ADA)
post-up route add -net 10.70.1.0 netmask 255.255.255.128 gw 10.70.0.6       # A7
post-up route add -net 10.70.0.8 netmask 255.255.255.252 gw 10.70.0.6       # A8
post-up route add -net 10.70.0.12 netmask 255.255.255.252 gw 10.70.0.6      # A9
post-up route add -net 10.70.0.16 netmask 255.255.255.252 gw 10.70.0.6      # A10
post-up route add -net 10.70.1.128 netmask 255.255.255.128 gw 10.70.0.6     # A11
post-up route add -net 10.70.0.64 netmask 255.255.255.240 gw 10.70.0.6      # A12
post-up route add -net 10.70.0.0 netmask 255.255.252.0 gw 10.70.0.6         # A13
post-up route add -net 10.70.0.20 netmask 255.255.255.252 gw 10.70.0.6      # A14
post-up route add -net 10.70.4.0 netmask 255.255.254.0 gw 10.70.0.6         # A15
post-up route add -net 10.70.6.0 netmask 255.255.254.0 gw 10.70.0.6         # A16

# NAT Configuration
post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
