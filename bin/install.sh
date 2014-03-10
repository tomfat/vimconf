#!/bin/bash
cd $(dirname $0)/..

ROOT_DIR=`pwd`
BIN_DIR=$ROOT_DIR/bin
cd ~
HOME_DIR=`pwd`
VIM_DIR=$HOME_DIR/.vim
AUTOLOAD_DIR=$VIM_DIR/autoload
BUNDLE_DIR=$ROOT_DIR/bundle

echo "----Create .vim dir..."
mkdir "$VIM_DIR"
mkdir "$AUTOLOAD_DIR"
mkdir "$BUNDLE_DIR"

echo "----Copy .vimrc"
cp $ROOT_DIR/_vimrc $ROOT_DIR/.vimrc -f
dos2unix $ROOT_DIR/.vimrc

#Install plugins

echo "----Install pathogen"
#pathogen is plugin used to manage other plugin in a neat way
git submodule add git://github.com/tpope/vim-pathogen.git pathogen

# Switch to bundle directory
cd "$BUNDLE_DIR"

echo "----Install delimitmate"
git submodule add git://github.com/Raimondi/delimitMate.git delmitmate

echo "----Install desert color schema"
git submodule add git://github.com/vim-scripts/desert.vim.git desert

echo "----Install nerdtree"
git submodule add git://github.com/scrooloose/nerdtree.git nerdtree

#echo "----Install taglist"
#git submodule add git://github.com/vim-scripts/taglist.vim.git targlist

echo "----Install jsbeatify"
git submodule add git://github.com/maksimr/vim-jsbeautify.git jsbeautify

echo "----Instal solorized color"
git submodule add  git://github.com/altercation/vim-colors-solarized.git solarized

echo "----Instal close tag"
git submodule add git://github.com/docunext/closetag.vim.git closetag

echo "----Instal supertab"
git submodule add git://github.com/ervandew/supertab.git supertab

echo "----Instal tagbar"
git submodule add git://github.com/majutsushi/tagbar.git tagbar

echo "----Instal nerdcommenter"
git submodule add git://github.com/scrooloose/nerdcommenter.git nerdcommenter

echo "----Install linediff"
git submodule add https://github.com/vim-scripts/linediff.vim.git linediff

#echo "----Instal pyflakes"
#git submodule add git://github.com/kevinw/pyflakes-vim.git pyflakes

cd $ROOT_DIR
git submodule update --init --recursive

#Creat links
cd $HOME_DIR
ln -s -T $ROOT_DIR/.vimrc .vimrc -f

cd $VIM_DIR
ln -s -T $ROOT_DIR/bundle bundle -f

cd $AUTOLOAD_DIR
ln -s -T $ROOT_DIR/pathogen/autoload/pathogen.vim pathogen.vim -f

