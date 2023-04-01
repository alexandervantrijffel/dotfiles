if type feh 1>/dev/null; then
  BGFOLDER=$HOME/Pictures/backgrounds
  [[ ! -d $BGFOLDER ]] && BGFOLDER=$HOME/pictures/backgrounds

  [ -d $BGFOLDER ] && feh --slideshow-delay 1800 --bg-fill $BGFOLDER -z -r -D1800

  # --bg-tile
  # --bg-fill or --bg-scale?
  # or use --zoom fill
  
  # foreground window
  alias fehfg='nohup feh -zrs --scale-down --image-bg black --slideshow-delay 3600 ~/Pictures/fehbackgrounds > /tmp/feh.nohup.out.${RANDOM} &'
fi
