#!/bin/bash

sudo brctl addif br0 tap0
sudo brctl addif br0 tap1
sudo brctl addif br0 tap2
sudo brctl addif br0 tap3

sudo ifconfig tap0 up
sudo ifconfig tap1 up
sudo ifconfig tap2 up
sudo ifconfig tap3 up

sudo sysctl -w net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -s 172.20.2.0/16 -o wlan0 -j MASQUERADE

