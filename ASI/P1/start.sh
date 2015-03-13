#!/bin/bash

sudo kvm dns1.qcow2 -net nic,macaddr=52:54:00:99:02:57 -net tap,script=no &
sudo kvm dns2.qcow2 -net nic,macaddr=52:54:00:99:02:58 -net tap,script=no &
sudo kvm mail1.qcow2 -net nic,macaddr=52:54:00:99:02:59 -net tap,script=no &
