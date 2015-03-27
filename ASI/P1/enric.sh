#!/bin/bash

sudo gnome-terminal -e "bash -c \"/usr/sbin/openvpn --config client.txt; exec bash\"" &

sleep 15

sudo brctl addif br0 tap0
sudo ifconfig tap0 up
