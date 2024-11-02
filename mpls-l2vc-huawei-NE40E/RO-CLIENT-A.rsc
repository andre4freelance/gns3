# 2024-11-02 16:23:00 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
/interface ethernet
set [ find default-name=ether1 ] comment=P2-Eth1/0/6 disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface vlan
add interface=ether1 name="[100] - INET" vlan-id=100
/port
set 0 name=serial0
/ip settings
set max-neighbor-entries=4096
/ipv6 settings
set max-neighbor-entries=2048
/ip address
add address=10.104.12.2/30 interface="[100] - INET" network=10.104.12.0
/ip route
add disabled=no dst-address=0.0.0.0/0 gateway=10.104.12.1 routing-table=main \
    suppress-hw-offload=no
/system identity
set name=RO-CLIENT-A
/system note
set show-at-login=no
