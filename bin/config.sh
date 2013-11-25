#!/bin/bash
cd $(dirname $0)/..

ROOT_DIR=`pwd`
BIN_DIR=$ROOT_DIR/bin
VIM_DIR="~/.vim"
CONF_DIR=$ROOT_DIR/vimfiles

echo $BIN_DIR
echo $ROOT_DIR
echo $CONF_DIR

echo "Check folder $VIM_DIR"
if [ ! -d "$VIM_DIR" ]
then
	echo "Create .vim folder..."
#	mkdir $VIM_DIR
fi

