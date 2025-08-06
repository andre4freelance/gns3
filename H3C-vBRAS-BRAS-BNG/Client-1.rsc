# 2025-08-06 17:40:28 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
/interface ethernet
set [ find default-name=ether1 ] comment=INTERNET disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface pppoe-client
add add-default-route=yes disabled=no interface=ether1 name=pppoe-internet \
    user=user-test.local
/port
set 0 name=serial0
/ip settings
set max-neighbor-entries=4096
/ipv6 settings
set max-neighbor-entries=2048
/system identity
set name=Client-1
/system note
set show-at-login=no
/tool romon
set enabled=yes
