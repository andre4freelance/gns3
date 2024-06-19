# 2024-06-19 13:49:06 by RouterOS 7.14.3
# software id = TWIQ-YM3K
#
/interface ethernet
set [ find default-name=ether1 ] comment=WAN disable-running-check=no
set [ find default-name=ether2 ] comment=SW-DIST-Eth2/2 \
    disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
/interface vlan
add interface=ether2 name="[10] - VRRP CLIENT" vlan-id=10
/interface vrrp
add interface="[10] - VRRP CLIENT" name="VRRP - DHCP CLIENT" priority=10 \
    vrid=10
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.250
/ip dhcp-server
add address-pool=dhcp_pool0 interface="VRRP - DHCP CLIENT" name=dhcp1
/port
set 0 name=serial0
/ip address
add address=192.168.1.254/24 interface="[10] - VRRP CLIENT" network=\
    192.168.1.0
add address=192.168.1.1 interface="VRRP - DHCP CLIENT" network=192.168.1.1
/ip dhcp-client
add interface=ether1
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
/ip firewall nat
add action=masquerade chain=srcnat
/system identity
set name=RO-BACKUP
/system note
set show-at-login=no
