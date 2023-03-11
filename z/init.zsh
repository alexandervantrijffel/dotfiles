if [[ $(lsb_release -a 2>/dev/null) =~ "Ubuntu" ]]; then 
  znap source rupa/z z.sh
  znap eval rupa/z "touch ${HOME}/.z"
  # touch ${HOME}/.z
  # zplug "rupa/z", use:"*.sh", hook-build:"touch ${HOME}/.z", defer:2
else
  # from packman package z
  . /usr/share/z/z.sh
fi

alias zgha="z alexandervantrijffel"
alias zgh="z dev/github.com"
alias zgl="z dev/gitlab.com"
