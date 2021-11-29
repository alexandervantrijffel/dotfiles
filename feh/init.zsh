if type feh 1>/dev/null; then
  # --bg-fill or --bg-scale?
  # or use --zoom fill
  alias fehfg='nohup feh -zrs --scale-down --image-bg black --slideshow-delay 3600 ~/Pictures/fehbackgrounds &'
fi
