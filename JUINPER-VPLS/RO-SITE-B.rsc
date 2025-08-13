# 2025-08-13 18:58:01 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
set slot2 slot=slot2
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface vlan
add interface=ether1 name="[VLAN100] - RO-SITE-A" vlan-id=100
/port
set 0 name=serial0
/ip settings
set max-neighbor-entries=4096
/ipv6 settings
set max-neighbor-entries=2048
/ip address
add address=172.16.0.2/30 interface="[VLAN100] - RO-SITE-A"" network=\
    172.16.0.0
/system identity
set name=RO-SITE-B
/system note
set show-at-login=no
