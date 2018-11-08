if [ -z ${1} ]; then
DIR=.
else
DIR=$1
fi

inotifywait -r -e close_write,create -m --exclude "nopkg|\.git" $DIR | while read directory events filename; do
  go test $directory
done
