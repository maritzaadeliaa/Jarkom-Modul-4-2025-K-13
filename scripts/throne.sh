# File: /etc/network/interfaces
auto lo
iface lo inet loopback

# [eth0] Interface ke Switch1
auto eth0
iface eth0 inet static
    address 10.70.0.51
    netmask 255.255.255.248
    gateway 10.70.0.49  # Gateway ke Amroth

# [eth1] Interface ke Erebor (A22)
auto eth1
iface eth1 inet static
    address 10.70.0.57
    netmask 255.255.255.248

# Default route ke Amroth
post-up route add default gw 10.70.0.49

# IP Forwarding
post-up echo 1 > /proc/sys/net/ipv4/ip_forward
