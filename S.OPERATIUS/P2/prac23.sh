#!/bin/bash

awk  gsub(/[^a-zA-Z0-9_ \t]/, " ", $0) *.sh
