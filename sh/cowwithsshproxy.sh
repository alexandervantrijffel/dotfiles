if ! type cow 1>/dev/null; then
  echo "missing cow"
  echo "installation instructions: https://github.com/cyfdecyf/cow/blob/master/README-en.md"
  exit 127
fi
ssh -D 1080 -C -N lexremote@dlv.li -p 993 &
cow &
echo "Configure your browser to use the auto proxy configuration url http://127.0.0.1:7777/pac"

