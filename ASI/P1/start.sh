#!/bin/bash

#sudo gnome-terminal -e "bash -c \"/usr/sbin/openvpn --config client.txt; exec bash\"" &

sudo kvm dns1.qcow2 -net nic,macaddr=52:54:00:99:02:57 -net tap,script=no &
#sudo kvm dns2.qcow2 -net nic,macaddr=52:54:00:99:02:58 -net tap,script=no &
sudo kvm mail1.qcow2 -net nic,macaddr=52:54:00:99:02:59 -net tap,script=no &
#sudo kvm mail2.qcow2 -net nic,macaddr=52:54:00:99:02:60 -net tap,script=no &
#sudo kvm mail3.qcow2 -net nic,macaddr=52:54:00:99:02:61 -net tap,script=no &
sudo kvm web.qcow2 -net nic,macaddr=52:54:00:99:02:62 -net tap,script=no &

sleep 10


sudo brctl addif br0 tap0
sudo brctl addif br0 tap1
sudo brctl addif br0 tap2
sudo brctl addif br0 tap3
#sudo brctl addif br0 tap4
#sudo brctl addif br0 tap5
#sudo brctl addif br0 tap6

sudo ifconfig tap0 up
sudo ifconfig tap1 up
sudo ifconfig tap2 up
sudo ifconfig tap3 up
#sudo ifconfig tap4 up
#sudo ifconfig tap5 up
#sudo ifconfig tap6 up

sudo sysctl -w net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -s 172.20.2.0/16 -o wlan0 -j MASQUERADE

