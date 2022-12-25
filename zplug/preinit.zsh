# install zplug if required
export ZPLUG_HOME=/opt/fromgit/zplug
sudo mkdir -pv /opt/fromgit
! [[ -d $ZPLUG_HOME ]] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| sudo zsh

sudo chown -R $(whoami):$(whoami) /opt/fromgit 
source $ZPLUG_HOME/init.zsh

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
zplug "denilsonsa/prettyping", as:command, use:"prettyping", defer:3
# show aliases hints if abbrevations are available for typed commands
zplug "djui/alias-tips", defer:3
#zplug "ndbroadbent/scm_breeze", hook-build:"$ZPLUG_HOME/repos/ndbroadbent/scm_breeze/install.sh"
#

ARCH=$(dpkg --print-architecture)
if [[ "$ARCH" != *"arm64"* ]]; then 
#  # these plugs are not supported with aarch64
#  #
#  # alternative for exa
 zplug "Peltoche/lsd", as:command, from:gh-r, rename-to:lsd
 zplug "stedolan/jq", as:command, from:gh-r, defer:3
 zplug "sharkdp/fd", as:command, from:gh-r, rename-to:fd, defer:3
fi

zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh, defer:3
zplug "plugins/rsync", from:oh-my-zsh, defer:3
zplug "plugins/ssh-agent", from:oh-my-zsh, defer:3
zplug "plugins/kubectl", from:oh-my-zsh, defer:2
zplug "bonnefoa/kubectl-fzf", defer:3
zplug "so-fancy/diff-so-fancy", as:command, defer:3
zplug "zsh-users/zsh-autosuggestions", defer:3
zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2
zplug "zsh-users/zsh-completions", use:src, defer:3
# zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zdharma-continuum/fast-syntax-highlighting", defer:3
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "pjvds/zsh-cwd"
