#! /bin/sh -

! type golangci-lint 1>/dev/null && {
    echo "missing golangci-lint"
    echo "install via: https://github.com/golangci/golangci-lint"
    exit 127
}

! type fswatch 1>/dev/null && {
    echo "missing inotifywait"
    echo "install with:"
    echo "brew install fswatch"
    exit 127
}

! type gotestsum 1>/dev/null && {
    echo "missing gotestsum"
    echo "go get gotest.tools/gotestsum"
    exit 127
}
if [ -z ${1} ]; then
    SEARCHDIR=.
else
    SEARCHDIR=$1
fi

fswatch -l 5 -e ".*" -i "\\.go$" $SEARCHDIR | while read filepath; do \
        echo "testing directory ${filepath}"
    CHANGESDIR="$(dirname -- ${filepath})"
    echo "testing directory $CHANGESDIR"
    if ls $CHANGESDIR/*.go > /dev/null
    then
        echo "Executing golangci-lint"
        golangci-lint run -E goimports -E dupl -E megacheck -E unconvert "$CHANGESDIR"
        RESULT=$?
        if [ $RESULT -eq 0 ]; then
            echo "Running tests of package $CHANGESDIR/"
            # go test -v -tags=integration $CHANGESDIR
            gotestsum --format dots "$CHANGESDIR"
        fi
    fi
done
golangci-lint run -E goimports -E dupl -E megacheck -E unconvert "/data/dev/go/src/gitlab.com/avtnl/ps-737migration-be/workspace/magentoorderprocessor/..."
