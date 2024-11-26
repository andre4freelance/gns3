# 2024-11-26 17:25:08 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
set slot2 slot=slot2
set slot3 slot=slot3
set slot4 slot=slot4
set slot5 slot=slot5
set slot6 slot=slot6
set slot7 slot=slot7
/interface ethernet
set [ find default-name=ether1 ] comment=CORE-SW-1/1/3 disable-running-check=\
    no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface vlan
add interface=ether1 name="[1003] - R1" vlan-id=1003
add interface=ether1 name="[1004] - R2" vlan-id=1004
/port
set 0 name=serial0
/routing bgp template
add as=64523 disabled=no name=EBGP output.redistribute=connected,static,bgp
/ip settings
set max-neighbor-entries=4096
/ipv6 settings
set max-neighbor-entries=2048
/ip address
add address=10.0.0.10/30 interface="[1004] - R2" network=10.0.0.8
add address=10.0.0.6/30 interface="[1003] - R1" network=10.0.0.4
add address=10.3.3.3 interface=lo network=10.3.3.3
/routing bgp connection
add as=64523 disabled=no local.role=ebgp name=R1 output.redistribute=\
    connected,static,bgp remote.address=10.0.0.5/32 .as=64521 routing-table=\
    main templates=EBGP
add disabled=no local.role=ebgp name=R2 remote.address=10.0.0.9/32 .as=64522 \
    templates=EBGP
/system identity
set name=R3
/system note
set show-at-login=no
