if type duf 1>/dev/null; then
    alias df="duf"
fi

if type ncdu 1>/dev/null; then
    alias du="ncdu"
else 
    alias du="du -h --max-depth=1 "
fi

alias dus="du | sort -h"
