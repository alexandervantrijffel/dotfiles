#! /bin/sh -

if ! type golangci-lint &>/dev/null; then
  echo "missing golangci-lint"
  echo "install via: https://github.com/golangci/golangci-lint"
  exit 127
fi

if ! type inotifywait &>/dev/null; then
  echo "missing inotifywait"
  echo "apt install inotify-tool"
  exit 127
fi


if [ -z ${1} ]; then
DIR=.
else
DIR=$1
fi

HOST=AB

inotifywait -r -e create -m --exclude "nopkg|\.git" $DIR | while read directory events filename; do
  case $filename in (*".go")
     echo "Executing golangci-lint"
     golangci-lint run -E goimports -E dupl -E megacheck -E unconvert $directory/...
     RESULT=$?
     if [ $RESULT -eq 0 ]; then
       echo "Running tests of package ${directory#./}"
       go test $directory
     fi
  ;; esac
done



