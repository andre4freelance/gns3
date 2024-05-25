# 2024-05-15 22:25:49 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
set slot2 slot=slot2
set slot3 slot=slot3
set slot4 slot=slot4
set slot5 slot=slot5
/interface ethernet
set [ find default-name=ether1 ] comment=LEAF-eth1 disable-running-check=no
set [ find default-name=ether2 ] comment=VTEP2-eth2 disable-running-check=no
set [ find default-name=ether3 ] comment=VTEP3-eth3 disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/port
set 0 name=serial0
/routing ospf instance
add disabled=no name=VTEP-1 redistribute=connected,static,ospf router-id=\
    10.10.10.1
/routing ospf area
add disabled=no instance=VTEP-1 name=METRO-E
/routing bgp template
set default as=65001 disabled=no input.filter=input multihop=yes \
    output.filter-chain=output .redistribute=connected,static,bgp router-id=\
    10.10.10.1 routing-table=main
/ip address
add address=10.10.10.1 interface=lo network=10.10.10.1
add address=10.10.10.22/30 interface=ether1 network=10.10.10.20
add address=10.10.10.33/30 interface=ether2 network=10.10.10.32
add address=10.10.10.37/30 interface=ether3 network=10.10.10.36
/routing ospf interface-template
add area=METRO-E disabled=no interfaces=ether1,ether2,ether3
add area=METRO-E disabled=no interfaces=lo networks=10.10.10.1/32
/system identity
set name=VTEP-1
/system note
set show-at-login=no
/tool romon
set enabled=yes
