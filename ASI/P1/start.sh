#!/bin/bash

sudo kvm derivada.qcow2 −net nic,macaddr=52:54:00:99:34:57 −net tap,script=no

sudo kvm derivada2.qcow2 −net nic,macaddr=52:54:00:99:34:58 −net tap,script=no
