# may/11/2024 07:33:46 by RouterOS 6.48.1
# software id = NQ1S-XPTC
#
#
#
/interface ethernet
set [ find default-name=ether5 ] comment=ESW1-fa1/0 name=ether1
set [ find default-name=ether1 ] comment=ESW2-fa1/0 name=ether2
set [ find default-name=ether2 ] name=ether3
set [ find default-name=ether3 ] name=ether4
set [ find default-name=ether4 ] name=ether5
/interface vlan
add interface=ether1 name="[100] - POP-A via ESW-1" vlan-id=100
add interface=ether2 name="[200] - POP-A via ESW-2 " vlan-id=200
/interface bonding
add name=BONDING-POP-A slaves=\
    "[100] - POP-A via ESW-1,[200] - POP-A via ESW-2 "
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/lora servers
add address=eu.mikrotik.thethings.industries down-port=1700 name=TTN-EU \
    up-port=1700
add address=us.mikrotik.thethings.industries down-port=1700 name=TTN-US \
    up-port=1700
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/ip address
add address=10.10.10.1/30 interface=BONDING-POP-A network=10.10.10.0
/ip cloud
set update-time=no
/system identity
set name=RO-DIST
/system lcd
set contrast=0 enabled=no port=parallel type=24x4
/system lcd page
set time disabled=yes display-time=5s
set resources disabled=yes display-time=5s
set uptime disabled=yes display-time=5s
set packets disabled=yes display-time=5s
set bits disabled=yes display-time=5s
set version disabled=yes display-time=5s
set identity disabled=yes display-time=5s
set "[100] - POP-A via ESW-1" disabled=yes display-time=5s
set ether1 disabled=yes display-time=5s
set ether2 disabled=yes display-time=5s
set ether3 disabled=yes display-time=5s
set ether4 disabled=yes display-time=5s
set ether5 disabled=yes display-time=5s
set BONDING-POP-A disabled=yes display-time=5s
set "[200] - POP-A via ESW-2 " disabled=yes display-time=5s
/tool romon
set enabled=yes secrets=123
/tool user-manager database
set db-path=user-manager
