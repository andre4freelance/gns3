# 2024-11-02 16:26:32 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
/interface ethernet
set [ find default-name=ether1 ] comment=PE1-Eth1/0/6 disable-running-check=\
    no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface vlan
add interface=ether1 name="[100] - CLIENT-A" vlan-id=100
/port
set 0 name=serial0
/ip settings
set max-neighbor-entries=4096
/ipv6 settings
set max-neighbor-entries=2048
/ip address
add address=10.104.12.1/30 interface="[100] - CLIENT-A" network=10.104.12.0
add address=8.8.8.8 interface=lo network=8.8.8.8
/system identity
set name=RO-DIST
/system note
set show-at-login=no
