#!/bin/bash

declare -i ID
ID=`xinput list | grep -Eo 'Generic Mouse\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
echo id is $ID 
declare -i STATE
STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable $ID
    echo "Touchpad disabled."
else
    xinput enable $ID
    echo "Touchpad enabled."
fi