type cargo 2>&1 > /dev/null && {
    export $CARGO_HOME="$XDG_CONFIG_DIR/cargo"
    ! f $CARGO_HOME/bin/sccache 2>&1 > /dev/null && {
        cargo install sccache
    }
}
