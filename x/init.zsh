#!/bin/zsh
THISDIR=${0:a:h}

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
    type notify-send 1>/dev/null && notify-send -i display "lodpi mode" -u low
    export QT_SCALE_FACTOR=1
    export GDK_SCALE=1
    export GDK_DPI_SCALE=1.0
    # xrandr --output Virtual-1 --auto --pos 0x0 --rotate normal --dpi 110 --primary --filter nearest --primary
fi

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=1
