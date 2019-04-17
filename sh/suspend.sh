#!/bin/bash +x
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
echo mem > /sys/power/state
