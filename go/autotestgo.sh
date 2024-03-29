#!/bin/sh -

! type golangci-lint 1>/dev/null && {
    echo "missing golangci-lint"
    echo "install via: https://github.com/golangci/golangci-lint"
    exit 127
}

! type inotifywait 1>/dev/null && {
    echo "missing inotifywait"
    echo "apt install inotify-tools"
    exit 127
}

! type gotestsum 1>/dev/null && {
    echo "missing gotestsum"
    echo "go get gotest.tools/gotestsum"
    exit 127
}

if [ -z ${1} ]; then
    DIR=.
else
    DIR=$1
fi

inotifywait -r -m -e CREATE --format "%w" --exclude "nopkg|\.git" $DIR | while read directory; do
    if ls ${directory}*.go > /dev/null
    then
        echo "Executing golangci-lint"
        golangci-lint run -E goimports -E dupl -E megacheck -E unconvert ${directory}
        RESULT=$?
        if [ $RESULT -eq 0 ]; then
            echo "Running tests of package ${directory#./}"
            # go test -v -tags=integration $directory
            gotestsum --format dots "${directory}" 2>&1 | pp

            # or use:
            # gotestsum --watch
        fi
    fi
done
