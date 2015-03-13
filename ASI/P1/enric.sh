#!/bin/bash

sudo brctl addif br0 tap0
sudo ifconfig tap0 up
