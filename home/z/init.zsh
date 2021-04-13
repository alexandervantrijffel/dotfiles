zplug "rupa/z", use:"*.sh", hook-build:"touch ${HOME}/.z", defer:2

alias zfbe="z ps-737migration-be"
alias zfbev="z ps-737migration-be && v"
alias zfbew="z ps-737migration-be && cd workspace"

alias zffe="z ps-licenseadmin-fe"
alias zffev="z ps-licenseadmin-fe && v"
alias zffey="z ps-licenseadmin-fe && yrs"

alias zss="z search-service"
alias zssv="z search-service && v"
alias zssy="z search-service && yarn serve"
