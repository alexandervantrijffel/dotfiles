type cargo 2>&1 > /dev/null && {
    export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
    [ -e "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
    PATH="$PATH:$CARGO_HOME/bin"
}
