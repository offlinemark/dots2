#!/bin/bash

# i don't know bash so i just took james's, go follow him github.com/semaj

########## Variables

echo ">> INFECTING!"
dir=~/dots                    # dotfiles directory
target=~
files="vimrc vim tmux.conf gitignore gitconfig gdbinit aliases"    # list of files/folders to symlink in homedir

##########

for file in $files; do
  echo "Dealing with .$file:"
  if [[ ! -L $target/.$file ]]; then
    echo "  Creating symlink to dots $file in home directory."
    ln -sv $dir/.$file $target/.$file
  else
    echo "  Already symlinked. Doing nothing."
  fi
done

ln -sv $dir/fish $target/.config/fish
ln -sv $dir/fish/config.fish $target/.fishrc

echo ">> DONE INFECTING!"
