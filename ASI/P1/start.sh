#!/bin/bash

sudo kvm derivada.qcow2 -net nic,macaddr=52:54:00:99:34:57 -net tap,script=no &
sudo kvm derivada2.qcow2 -net nic,macaddr=52:54:00:99:34:58 -net tap,script=no &

sudo brctl addif br0 tap1
sudo brctl addif br0 tap2

sudo ifconfig tap1 up
sudo ifconfig tap2 up
