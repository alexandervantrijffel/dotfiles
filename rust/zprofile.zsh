type cargo 2>&1 > /dev/null && {
    ! type sccache 2>&1 > /dev/null && {
        cargo install sccache
    }
}
