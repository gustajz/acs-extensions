#!/bin/bash
echo "Configure MTU..."
ifconfig eth0 mtu 1350 up

sed -i '/send host-name/a supercede interface-mtu 1350;' /etc/dhcp/dhclient.conf
sed -i '/send host-name/a default interface-mtu 1350;' /etc/dhcp/dhclient.conf

echo "Finished configuration"