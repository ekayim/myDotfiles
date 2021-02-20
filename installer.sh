#!/bin/zsh
# installer.sh : create symbolic link from dotfiles here to appropriate location
# **This installer execute "ln" command forcibly**
if [ "`basename $PWD`" != "myDotfiles" ]; then
  echo "Can't execute this installer from outside of this directory"
  exit 1
fi

echo -e "\e[31mCAUTION! : This script creates symbolic links FORCIBLY.\e[m\n"

dotfile_list=("zshrc" "vimrc" "tmux.conf")
dotfile_description=("zsh rc file (.zshrc)" "vim rc file (.vimrc)" "tmux conf file (.tmux.conf)")
link_relative_dest=(".zshrc" ".vimrc" ".tmux.conf")

i=1
while [ -n "$dotfile_list[i]" ]
do
  echo -ne "Do you want to create a symbolic link of\e[33m $dotfile_description[i]\e[m ? [y/n]: "
  read ans
  if [ "$ans" = "y" ]; then
    ln -sf $PWD/dotfiles/$dotfile_list[i] $HOME/$link_relative_dest[i]
    echo "=> \e[32mDone.\e[m\n"
  else
    echo "=> \e[34m$dotfile_description[i] installation skipped.\e[m\n"
  fi
  (( i++ ))
  unset ans
done
echo -e "\n\e[32mInstallation finished.\e[m"
