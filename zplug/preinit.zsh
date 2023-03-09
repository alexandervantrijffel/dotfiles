# install zplug if required
export ZPLUG_HOME=/opt/fromgit/zplug

# if ! [[ -d $ZPLUG_HOME ]]; then
#   sudo mkdir -pv $ZPLUG_HOME
#   curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| sudo zsh
#   ME=$(logname)
#   sudo chown -R root:${ME} $ZPLUG_HOME
#   mkdir -pv $ZPLUG_HOME/log
#   sudo chmod -R 775 $ZPLUG_HOME/log
#   mkdir -pv $ZPLUG_HOME/cache
#   sudo chmod -R 775 $ZPLUG_HOME/cache
# fi

. $ZPLUG_HOME/init.zsh
