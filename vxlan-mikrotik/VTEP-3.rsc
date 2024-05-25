# 2024-05-15 22:23:47 by RouterOS 7.14.3
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
add name="BRIGDE - VLAN100"
/interface ethernet
set [ find default-name=ether1 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full comment=\
    LEAF-eth3 disable-running-check=no
set [ find default-name=ether2 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full comment=\
    VTEP2-eth3 disable-running-check=no
set [ find default-name=ether3 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full comment=\
    VTEP1-eth3 disable-running-check=no
set [ find default-name=ether4 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full comment=\
    XC-SW-CLIENT-PT-A-fa1/0 disable-running-check=no
set [ find default-name=ether5 ] advertise=\
    10M-baseT-half,10M-baseT-full,100M-baseT-half,100M-baseT-full \
    disable-running-check=no
/interface vlan
add interface=ether4 name="[100] - PT-A" vlan-id=100
/interface vxlan
add local-address=10.10.10.3 mac-address=9A:10:95:8C:9D:18 name=\
    "[5000] - VLAN100" port=8472 vni=5000 vrf=main vteps-ip-version=ipv4
/port
set 0 name=serial0
/routing ospf instance
add disabled=no name=VTEP-3 redistribute=connected,static,ospf router-id=\
    10.10.10.3
/routing ospf area
add disabled=no instance=VTEP-3 name=METRO-E
/routing bgp template
set default as=65003 disabled=no input.filter=input multihop=yes \
    output.filter-chain=output .redistribute=connected,static,bgp router-id=\
    10.10.10.3 routing-table=main
/interface bridge port
add bridge="BRIGDE - VLAN100" interface="[100] - PT-A"
add bridge="BRIGDE - VLAN100" interface="[5000] - VLAN100"
/interface vxlan vteps
add interface="[5000] - VLAN100" remote-ip=10.10.10.2
/ip address
add address=10.10.10.3 interface=lo network=10.10.10.3
add address=10.10.10.30/30 interface=ether1 network=10.10.10.28
add address=10.10.10.38/30 interface=ether3 network=10.10.10.36
add address=10.10.10.42/30 interface=ether2 network=10.10.10.40
/routing ospf interface-template
add area=METRO-E disabled=no interfaces=ether1,ether2,ether3
add area=METRO-E disabled=no interfaces=lo networks=10.10.10.3/32
/system identity
set name=VTEP-3
/system note
set show-at-login=no
/tool romon
set enabled=yes
