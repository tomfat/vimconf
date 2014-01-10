#!/bin/bash
cd $(dirname $0)/..

ROOT_DIR=`pwd`
BIN_DIR=$ROOT_DIR/bin
cd ~
HOME_DIR=`pwd`
VIM_DIR=$HOME_DIR/.vim
AUTOLOAD_DIR=$VIM_DIR/autoload
BUNDLE_DIR=$VIM_DIR/bundle

echo "----Create .vim dir..."
mkdir "$VIM_DIR"
mkdir "$AUTOLOAD_DIR"
mkdir "$BUNDLE_DIR"

echo "----Copy .vimrc"
cp $ROOT_DIR/_vimrc $HOME_DIR/.vimrc -b
dos2unix $HOME_DIR/.vimrc

#Install plugins
#Switch to .vim dir
cd "$VIM_DIR"

echo "----Install pathogen"
#pathogen is plugin used to manage other plugin in a neat way
git clone git://github.com/tpope/vim-pathogen.git pathogen
echo "----Copy pathogen"
cp pathogen/autoload/* $AUTOLOAD_DIR

# all other plugin will be installed under bundle folder.

# Switch to bundle directory
cd "$BUNDLE_DIR"

echo "----Install delimitmate"
git clone git://github.com/Raimondi/delimitMate.git delmitmate

echo "----Install desert color schema"
git clone git://github.com/vim-scripts/desert.vim.git desert

echo "----Install nerdtree"
git clone git://github.com/scrooloose/nerdtree.git nerdtree

echo "----Install taglist"
git clone git://github.com/vim-scripts/taglist.vim.git targlist

echo "----Install jsbeatify"
git clone git://github.com/maksimr/vim-jsbeautify.git jsbeautify
cd jsbeautify
git submodule update --init --recursive
cd ..
