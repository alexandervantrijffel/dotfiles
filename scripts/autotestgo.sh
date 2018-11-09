#! /bin/sh -

# Make sure to install golangci-lint for this
# https://github.com/golangci/golangci-lint

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



