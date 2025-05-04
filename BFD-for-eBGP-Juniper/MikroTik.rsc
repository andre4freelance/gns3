# 2025-05-03 20:33:52 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/port
set 0 name=serial0
/ip settings
set max-neighbor-entries=4096
/ipv6 settings
set max-neighbor-entries=2048
/ip address
add address=10.200.0.2/30 interface=ether1 network=10.200.0.0
/ip route
add dst-address=0.0.0.0/0 gateway=10.200.0.1
/system note
set show-at-login=no
/tool romon
set enabled=yes
