# caps lock = control key
# re-run this when plugging in another keyboard
type setxkbmap > /dev/null 2>&1 && setxkbmap -option ctrl:nocaps

# after entering repeat command like !-2, press space to auto-expand the command
bindkey ' ' magic-space

# execute auto suggestion with CTRL E
bindkey "^E" autosuggest-execute
bindkey "^F" forward-word

stty start undef  # disable C-s stopping receiving keyboard signals.
stty stop undef
