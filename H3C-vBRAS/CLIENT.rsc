# dec/23/2024 16:18:18 by RouterOS 6.48.1
# software id = NQ1S-XPTC
#
#
#
/interface pppoe-client
add add-default-route=yes disabled=no interface=ether1 name=pppoe-internet \
    password=pass use-peer-dns=yes user=user-test.local
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
/ip cloud
set update-time=no
/system identity
set name=CLIENT
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
set pppoe-internet disabled=yes display-time=5s
set ether1 disabled=yes display-time=5s
set ether2 disabled=yes display-time=5s
/tool user-manager database
set db-path=user-manager
