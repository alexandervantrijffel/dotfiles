 # for clipboard sharing with host and screen resizing
 if [[ $(lsb_release -a 2>/dev/null) =~ "Ubuntu" ]]; then 
  type vmware-user 1> /dev/null && vmware-user --no-startup-d &> /dev/null
fi

# type vmtoolsd 1>/dev/null && vmtoolsd -n vmusr &> /dev/null
