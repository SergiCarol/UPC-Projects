#!/bin/bash

/usr/sbin/openvpn --config client.txt &

sudo kvm derivada.qcow2 -net nic,macaddr=52:54:00:99:34:57 -net tap,script=no &
sudo kvm derivada2.qcow2 -net nic,macaddr=52:54:00:99:34:58 -net tap,script=no &

sudo brctl addif br0 tap1
sudo brctl addif br0 tap2

sudo ifconfig tap1 up
sudo ifconfig tap2 up

brctl show

sudo sysctl -w net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -s 172.20.2.0/16 -o wlan0 -j MASQUERADE
