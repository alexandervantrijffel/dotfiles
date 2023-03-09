if [[ $(lsb_release -a 2>/dev/null) =~ "Ubuntu" ]]; then 
  znap source rupa/z z.sh
  znap eval rupa/z "touch ${HOME}/.z"
  # touch ${HOME}/.z
  # zplug "rupa/z", use:"*.sh", hook-build:"touch ${HOME}/.z", defer:2
else
  # from packman package z
  . /usr/share/z/z.sh
fi

alias zfbe="z ps-737migration-be"
alias zfbev="z ps-737migration-be && v"
alias zfbew="z ps-737migration-be/workspace"

alias zffe="z ps-licenseadmin-fe"
alias zffev="z ps-licenseadmin-fe && v"
alias zffey="z ps-licenseadmin-fe && yrs"

alias zgha="z alexandervantrijffel"
alias zgh="z dev/github.com"
alias zgl="z dev/gitlab.com"

alias ztsb="z trainservicebus"
alias tsbv="z trainservicebus && v"

alias iosv="z ios && v"
