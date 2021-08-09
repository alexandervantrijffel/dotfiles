#!/bin/sh
for d in */ ; do 
   if [ -d $d/.git ]; then
         ( cd "$d" && echo Folder: $PWD && git checkout master && git pull --ff-only && git status  )
   fi
done
