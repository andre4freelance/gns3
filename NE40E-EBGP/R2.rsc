# 2024-11-26 17:23:18 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
set slot2 slot=slot2
set slot3 slot=slot3
set slot4 slot=slot4
set slot5 slot=slot5
set slot6 slot=slot6
/interface bridge
add name=loopback-konten-1
add name=loopback-konten-2
/interface ethernet
set [ find default-name=ether1 ] comment=CORE-SW-1/1/2 disable-running-check=\
    no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface vlan
add interface=ether1 name="[1002] - R1" vlan-id=1002
add interface=ether1 name="[1004] - R3" vlan-id=1004
add interface=ether1 name="[1005] - NE40E" vlan-id=1005
/port
set 0 name=serial0
/routing bgp template
add as=64522 disabled=no name=EBGP output.redistribute=connected,static,bgp \
    router-id=10.2.2.2 routing-table=main
/ip neighbor discovery-settings
set discover-interface-list=all
/ip settings
set max-neighbor-entries=4096
/ipv6 settings
set max-neighbor-entries=2048
/ip address
add address=10.0.0.2/30 interface="[1002] - R1" network=10.0.0.0
add address=10.0.0.9/30 interface="[1004] - R3" network=10.0.0.8
add address=10.2.2.2 interface=lo network=10.2.2.2
add address=8.8.8.8 interface=loopback-konten-1 network=8.8.8.8
add address=10.0.0.17/30 interface="[1005] - NE40E" network=10.0.0.16
add address=1.1.1.1 interface=loopback-konten-2 network=1.1.1.1
/routing bgp connection
add as=64522 disabled=no local.role=ebgp name=R1 output.redistribute=\
    connected,static,bgp remote.address=10.0.0.1/32 .as=64521 router-id=\
    10.2.2.2 routing-table=main templates=EBGP
add disabled=no local.role=ebgp name=R3 remote.address=10.0.0.10/32 .as=64523 \
    routing-table=main templates=EBGP
add as=64522 disabled=no local.role=ebgp name=NE40E output.redistribute=\
    connected,static,bgp remote.address=10.0.0.18/32 .as=64524 router-id=\
    10.2.2.2 routing-table=main templates=EBGP
/system identity
set name=R2
/system note
set show-at-login=no
