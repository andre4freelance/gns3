# 2024-11-26 17:26:08 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
set slot2 slot=slot2
set slot3 slot=slot3
set slot4 slot=slot4
set slot5 slot=slot5
set slot6 slot=slot6
/interface ethernet
set [ find default-name=ether1 ] comment=CORE-SW-1/1/1 disable-running-check=\
    no
set [ find default-name=ether2 ] comment=CORE-SW-1/1/5 disable-running-check=\
    no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface bonding
add mode=802.3ad name=BOND-CORE-SW slaves=ether1,ether2
/interface vlan
# MTU > L2MTU
add interface=BOND-CORE-SW name="[1001] - NE40E" vlan-id=1001
# MTU > L2MTU
add interface=BOND-CORE-SW name="[1002] - R2" vlan-id=1002
# MTU > L2MTU
add interface=BOND-CORE-SW name="[1003] - R3" vlan-id=1003
/port
set 0 name=serial0
/routing bgp template
add as=64521 disabled=no name=EBGP output.redistribute=connected,static,bgp \
    router-id=10.1.1.1 routing-table=main
/ip settings
set max-neighbor-entries=4096
/ipv6 settings
set max-neighbor-entries=2048
/ip address
add address=10.0.0.1/30 interface="[1002] - R2" network=10.0.0.0
add address=10.0.0.5/30 interface="[1003] - R3" network=10.0.0.4
add address=10.0.0.13/30 interface="[1001] - NE40E" network=10.0.0.12
add address=10.1.1.1 interface=lo network=10.1.1.1
/routing bgp connection
add as=64521 disabled=no local.role=ebgp name=R3 output.redistribute=\
    connected,static,bgp remote.address=10.0.0.6/32 .as=64523 router-id=\
    10.1.1.1 routing-table=main templates=EBGP
add as=64521 disabled=no local.role=ebgp name=R2 output.redistribute=\
    connected,static,bgp remote.address=10.0.0.2/32 .as=64522 router-id=\
    10.1.1.1 routing-table=main templates=EBGP
add as=64521 disabled=no local.role=ebgp name=NE40E output.redistribute=\
    connected,static,bgp remote.address=10.0.0.14/32 .as=64524 router-id=\
    10.1.1.1 routing-table=main templates=EBGP
/system identity
set name=R1
/system note
set show-at-login=no
