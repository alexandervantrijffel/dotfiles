type fortune 1>/dev/null && {
    fortune | xargs -0 echo -e "     $(date "+ %A %e %B %R Week %V")\n\n"
    # fortune | cowsay -f meow | xargs -0 echo -e "     $(date "+ %A %e %B %R Week %V")\n"
}
