#!/bin/bash


# i don't know bash so i just took james's, go follow him github.com/semaj

########## Variables

echo ">> INFECTING!"
dir=~/dots                    # dotfiles directory
target=~
files="abbr.fish vimrc tmux.conf gitignore gitconfig gdbinit aliases"    # list of files/folders to symlink in homedir

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

ln -sv $dir/fish $target/.config/
ln -sv $dir/fish/config.fish $target/.fishrc

touch ~/.vimrc.local

# build-essential

# fish
# sudo apt-add-repository ppa:fish-shell/release-3
# sudo apt update
# sudo apt install fish


# plug vim
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# sudo chsh vagrant -s /usr/bin/fish

echo ">> DONE INFECTING!"
