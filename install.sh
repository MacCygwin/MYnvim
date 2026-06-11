#!/bin/bash

DIRECTORY="$HOME/.config/nvim"

if [ -d "$DIRECTORY" ]; then
  echo "Directory '$DIRECTORY' exists."
else
  echo "Directory '$DIRECTORY' does not exist."
  echo "Creating Directory.." && mkdir -p $DIRECTORY
  echo "Done"
fi

mv init.lua $DIRECTORY
mv lazy-lock.json $DIRECTORY
mv lua/ $DIRECTORY

sleep 1
echo "Transfer done. Now you can try MYnvim"
exit 0
