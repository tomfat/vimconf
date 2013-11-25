#!/bin/bash
cd $(dirname $0)/..

ROOT_DIR=`pwd`
BIN_DIR=$ROOT_DIR/bin
cd ~
HOME_DIR=`pwd`
VIM_DIR=$HOME_DIR/.vim
VIM_FILES_DIR=$ROOT_DIR/vimfiles

echo "Check folder $VIM_DIR"
if [ ! -d "$VIM_DIR" ]
then
	echo "Create .vim folder..."
	mkdir "$VIM_DIR"
fi

echo "Copy .vimrc"
cp $ROOT_DIR/_vimrc $HOME_DIR/.vimrc -b

echo "Copy plugin and doc"
cp $VIM_FILES_DIR/* $VIM_DIR -r
