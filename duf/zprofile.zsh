if ! type duf 1>/dev/null; then
  if [[ $(lsb_release -a 2>/dev/null) =~ "Ubuntu" ]]; then 
    wget https://github.com/muesli/duf/releases/download/v0.6.0/duf_0.6.0_linux_amd64.deb
    sudo dpkg -i duf_0.6.0_linux_amd64.deb
    rm -f duf_0.6.0_linux_amd64.deb
  fi
fi
