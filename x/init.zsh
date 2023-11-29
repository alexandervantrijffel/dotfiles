#!/bin/zsh
THISDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

FPATH=${FPATH}:$THISDIR/functions
autoload -z togglexdpi
autoload -z ishidpi

if ishidpi; then
    type notify-send 1>/dev/null && notify-send -i display "hidpi mode" -u low
    export GDK_SCALE=2
    export GDK_DPI_SCALE=0.5
    export QT_SCALE_FACTOR=2
    # xrandr --output Virtual-1 --auto --pos 0x0 --rotate normal --dpi 192 --primary --filter nearest
else
    if ! xrandr | grep -q "5120x1440_60.00"; then
      echo adding diplay mode 5120x1440_60.00
      xrandr --newmode "5120x1440_60.00"  624.50  5120 5496 6048 6976  1440 1443 1453 1493 -hsync +vsync
      xrandr --addmode Virtual-1 5120x1440_60.00
      xrandr --output Virtual-1 --auto --mode 5120x1440_60.00 --pos 0x0 --rotate normal --dpi 100 --scale 1x1
    fi

    type notify-send 1>/dev/null && notify-send -i display "lodpi mode" -u low
    export QT_SCALE_FACTOR=1
    export GDK_SCALE=1
    export GDK_DPI_SCALE=1.0
    # xrandr --output Virtual-1 --auto --pos 0x0 --rotate normal --dpi 110 --primary --filter nearest --primary
fi

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=1
