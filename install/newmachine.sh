# no last login message on mac
touch ~/.hushlogin
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DOTFILES="$(dirname "$THISDIR")"

# brew install fortune
ln -s $DOTFILES/fortunes /usr/local/share/games/fortunes

