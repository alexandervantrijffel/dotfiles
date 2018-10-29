if [ -z ${1} ]; then
echo "No param!"
DIR=.
else
DIR=$1
fi

# inotifywait -e close_write,moved_to,create -m . |
inotifywait -e close_write -m $DIR |
while read -r directory events filename; do
  go test
done
