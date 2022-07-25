#!/bin/sh

randompass() {
  < /dev/urandom tr -dc A-Za-z0-9 | head -c22 | tee /dev/tty | pbcopy 
}
