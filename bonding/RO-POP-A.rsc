# may/11/2024 07:33:13 by RouterOS 6.48.1
# software id = NQ1S-XPTC
#
#
#
/interface ethernet
set [ find default-name=ether1 ] comment=ESW3-fa1/0
set [ find default-name=ether2 ] comment=ESW3-fa1/4
/interface bonding
add name=BONDING-RO-DIST slaves=ether1,ether2
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
add address=10.10.10.2/30 interface=BONDING-RO-DIST network=10.10.10.0
/ip cloud
set update-time=no
/system identity
set name=RO-POP-A
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
set ether1 disabled=yes display-time=5s
set ether2 disabled=yes display-time=5s
set ether3 disabled=yes display-time=5s
set ether4 disabled=yes display-time=5s
set ether5 disabled=yes display-time=5s
set BONDING-RO-DIST disabled=yes display-time=5s
/tool romon
set enabled=yes secrets=123
/tool user-manager database
set db-path=user-manager
