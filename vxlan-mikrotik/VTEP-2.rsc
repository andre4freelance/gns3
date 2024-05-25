# 2024-05-15 22:18:13 by RouterOS 7.14.3
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
/interface bridge
add name=BRIDGE-VLAN100
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full comment=\
    LEAF-eth2 disable-running-check=no
set [ find default-name=ether2 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full comment=\
    VTEP1-eth2 disable-running-check=no
set [ find default-name=ether3 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full comment=\
    VTEP3-eth2 disable-running-check=no
set [ find default-name=ether4 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full comment=\
    XC-SW-DIST-PT-A-fa1/0 disable-running-check=no
set [ find default-name=ether5 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full \
    disable-running-check=no
/interface vlan
add interface=ether4 name="[100] - PT-A" vlan-id=100
/interface vxlan
add local-address=10.10.10.2 mac-address=6A:E2:91:10:46:49 name=\
    "[5000] - VLAN100" port=8472 vni=5000 vrf=main vteps-ip-version=ipv4
/port
set 0 name=serial0
/routing ospf instance
add disabled=no name=VTEP-2 redistribute=connected,static,ospf router-id=\
    10.10.10.2
/routing ospf area
add disabled=no instance=VTEP-2 name=METRO-E
/routing bgp template
set default as=65002 disabled=no multihop=yes output.redistribute=\
    connected,static,bgp router-id=10.10.10.2 routing-table=main
/interface bridge port
add bridge=BRIDGE-VLAN100 interface="[100] - PT-A"
add bridge=BRIDGE-VLAN100 interface="[5000] - VLAN100"
/interface vxlan vteps
add interface="[5000] - VLAN100" remote-ip=10.10.10.3
/ip address
add address=10.10.10.2 interface=lo network=10.10.10.2
add address=10.10.10.26/30 interface=ether1 network=10.10.10.24
add address=10.10.10.34/30 interface=ether2 network=10.10.10.32
add address=10.10.10.41/30 interface=ether3 network=10.10.10.40
/routing ospf interface-template
add area=METRO-E disabled=no interfaces=ether1,ether2,ether3
add area=METRO-E disabled=no interfaces=lo networks=10.10.10.2/32
/system identity
set name=VTEP-2
/system note
set show-at-login=no
/tool romon
set enabled=yes
