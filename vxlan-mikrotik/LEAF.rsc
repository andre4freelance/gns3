# 2024-05-15 22:22:29 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
set slot2 slot=slot2
set slot3 slot=slot3
set slot4 slot=slot4
set slot5 slot=slot5
/interface ethernet
set [ find default-name=ether1 ] comment=VTEP1-eth1 disable-running-check=no
set [ find default-name=ether2 ] comment=VTEP2-eth1 disable-running-check=no
set [ find default-name=ether3 ] comment=VTEP3-eth1 disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/port
set 0 name=serial0
/routing ospf instance
add disabled=no name=LEAF redistribute=connected,static,ospf router-id=\
    10.10.10.10
/routing ospf area
add disabled=no instance=LEAF name=METRO-E
/routing bgp template
set default as=65000 disabled=no input.filter=no multihop=yes \
    output.filter-chain=no .redistribute=connected,static,bgp router-id=\
    10.10.10.10 routing-table=main
/ip address
add address=10.10.10.10 interface=lo network=10.10.10.10
add address=10.10.10.21/30 interface=ether1 network=10.10.10.20
add address=10.10.10.25/30 interface=ether2 network=10.10.10.24
add address=10.10.10.29/30 interface=ether3 network=10.10.10.28
/routing ospf interface-template
add area=METRO-E disabled=no interfaces=ether1,ether2,ether3
add area=METRO-E disabled=no interfaces=lo networks=10.10.10.10/32
/system identity
set name=LEAF
/system note
set show-at-login=no
/tool romon
set enabled=yes
