#!/bin/bash

case $1 in
	"install" | "i")
		mv ~/.vimrc ./vimrc.old
		mv ~/.tmux.conf ./tmux.conf.old
		cp ./vimrc ~/.vimrc
		cp ./tmux.conf ~/.tmux.conf
	;;
	"uninstall" | "u")
		mv ./vimrc.old ~/.vimrc
		mv ./tmux.conf.old ~/.tmux.conf
	;;
	*)
		echo "install [(i)nstall | (u)install]"
	;;
esac
