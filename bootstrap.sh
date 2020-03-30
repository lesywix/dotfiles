#!/usr/bin/env bash

CONFIG_FILES=(
  .vim
  bin
  .aliases
#   .bash_profile
#   .bash_prompt
#   .bashrc
  .editorconfig
  .exports
  .functions
  .gitconfig
  .gitignore
  .tmux.conf
  .vimrc
  .zshrc
  .path
)

# backpack dir
if [ -d ~/dotfiles.bak ]
then
        echo "backpack dir already exists!"
else
        echo "backpack dir doesn't exist, create '~/dotfiles.bak' instead"
        mkdir ~/dotfiles.bak
fi

# backpack the old rc files
# make soft link to myrc
for file in ${CONFIG_FILES[@]}
do
        if [ -f ~/${file} ]
        then
                echo "${file} already exist!"
                mv ~/${file} ~/dotfiles.bak
        elif [ -h ~/${file} ]
        then
                echo "${file} is soft link, move to dotfiles.bak"
                mv ~/${file} ~/dotfiles.bak
        fi
        ln -s $PWD/${file} ~/${file}
        echo "Created link ~/${file} -> $PWD/${file}"
done

source ~/.zshrc
# install autoenv
# git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
# echo 'source ~/.autoenv/activate.sh' >> ~/.bashrc
