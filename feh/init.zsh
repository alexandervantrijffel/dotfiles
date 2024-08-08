type feh 1>/dev/null && {
    BGFOLDER=$HOME/Pictures/fehbackgrounds
    [[ ! -d $BGFOLDER ]] && BGFOLDER=$HOME/pictures/fehbackgrounds

    [ -d $BGFOLDER ] && zsh-defer feh --slideshow-delay 1800 --bg-fill $BGFOLDER -z -r -D1800

    # --bg-tile
    # --bg-fill or --bg-scale?
    # or use --zoom fill

    # foreground window
    alias fehfg='nohup feh -zrs --scale-down --image-bg black --slideshow-delay 3600 ~/pictures/backgrounds > /tmp/feh.nohup.out.${RANDOM} &'
}
