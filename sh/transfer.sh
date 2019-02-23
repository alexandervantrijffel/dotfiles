if [ $# -eq 0 ]; then
    echo "Usage:"
    echo "transfer.sh filenametobeuploaded"
fi
curl --upload-file $1 https://transfer.sh/$1 
