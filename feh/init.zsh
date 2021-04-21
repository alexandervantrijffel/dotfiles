if type feh 1>/dev/null; then
  feh --slideshow-delay 1800 --bg-tile $HOME/Pictures/backgrounds -z -r -D1800
  # // --bg-fill or --bg-scale?

  # or use --zoom fill
  alias fehfg='nohup feh -zrs --scale-down --image-bg black --slideshow-delay 3600 ~/Pictures/bgsrcpics &'
fi
