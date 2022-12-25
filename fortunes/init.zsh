if type fortune 1>/dev/null; then
  fortune | cowsay -f meow | xargs -0 echo -e "     $(date "+ %A %e %B %R Week %V")\n" 
fi

