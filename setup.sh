#!/bin/bash
export DOMAIN=$1

echo "Configure domain $DOMAIN..."
echo "search $DOMAIN" > /etc/resolvconf/resolv.conf.d/base

sed -i "/search/c\search reddog.microsoft.com $DOMAIN" /etc/resolv.conf

echo "Configure MTU..."
ifconfig eth0 mtu 1350 up

sed -i '/send host-name/a supercede interface-mtu 1350;' /etc/dhcp/dhclient.conf
sed -i '/send host-name/a default interface-mtu 1350;' /etc/dhcp/dhclient.conf

echo "Finished configuration"