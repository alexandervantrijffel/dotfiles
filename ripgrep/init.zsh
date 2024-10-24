#!/bin/zsh

! type rg 1>/dev/null && {
    # sudo apt-get install ripgrep
    ARCH=$(dpkg --print-architecture)
    if [[ "$ARCH" != *"arm64"* ]]; then
        zsh-defer znap eval BurntSushi/ripgrep 'mv ripgrep rg'
    fi
}


# ripgrep with preview
rgp() {
    outfile=$(mktemp)
    script --flush --quiet --return $outfile --command "rg \"$@\""
    rgp_exec $outfile --column "$@"
}

# ripgrep with preview, include files from .gitignore and .ignore
rgpu() {
    outfile=$(mktemp)
    rgoptions='-uu'

    script --flush --quiet --return $outfile --command "rg $rgoptions \"$@\""
    rgp_exec $outfile $rgoptions "$@"
}

rgp_exec() {
    local count=$(cat $1 | wc -l)

    if (( $count == 0 )); then
        echo Nothing found
    elif (( $count > 40)); then
        rg_previewonenter $2 "$3"
    fi

    rm ${outfile}
}

rg_previewonenter() {
    out=$(rg \
            --column \
            --line-number \
            --no-column \
            --no-heading \
            --fixed-strings \
            $1 \
            "$2" \
            | awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " start ":" end " " $4}' \
            | fzf --preview 'bat -p --wrap character --color always {1} --highlight-line {2} ' \
        --preview-window wrap)

    read -r filename line <<< "${out}"
    if [[ ! -z $filename ]]; then
        ${EDITOR:-vim} "${filename}" +"normal! ${line}zz"
    fi
}

# with ctrl+o command to navigate to line:column number
rg_previewonctrlo() {
    rg \
        --column \
        --no-heading \
        --fixed-strings \
        --hidden \
        "$@" \
        | awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " $3 " " start ":" end " " $4}' \
        | fzf \
        --bind "ctrl-o:execute(${EDITOR:-vim} \"+call cursor({2},{3})\" {1})+cancel" \
        --preview 'bat -p --wrap character --color always {1} --highlight-line {2}' \
        --preview-window wrap
}

export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/.ripgreprc
