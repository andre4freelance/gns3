# 2024-12-23 16:16:28 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/disk
set slot1 slot=slot1
set slot2 slot=slot2
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] comment=vBRAS-GE1/0 disable-running-check=no
set [ find default-name=ether4 ] comment=vBRAS-GE2/0 disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface bonding
add name=BOND-INTERNET slaves=ether1,ether2
add name=BOND-vBRAS slaves=ether3,ether4
/port
set 0 name=serial0
/ip settings
set max-neighbor-entries=4096
/ipv6 settings
set max-neighbor-entries=2048
/ip address
add address=10.104.13.1/30 interface=BOND-vBRAS network=10.104.13.0
add address=10.104.14.2/30 interface=BOND-INTERNET network=10.104.14.0
/ip firewall nat
add action=masquerade chain=srcnat src-address=10.1.0.0/24 to-addresses=\
    10.104.14.2
/ip route
add comment=Routing-vBRAS disabled=no distance=1 dst-address=10.1.0.0/24 \
    gateway=10.104.13.2 pref-src="" routing-table=main scope=30 \
    suppress-hw-offload=no target-scope=10
add disabled=no dst-address=8.8.8.8/32 gateway=10.104.14.1 routing-table=main \
    suppress-hw-offload=no
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=10.104.14.1 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10
add comment=Routing-content-INTERNET disabled=no distance=1 dst-address=\
    1.1.1.1/32 gateway=10.104.14.1 pref-src="" routing-table=main scope=30 \
    suppress-hw-offload=no target-scope=10
/system identity
set name=RO-GATEWAY
/system note
set show-at-login=no
