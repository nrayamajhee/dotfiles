#!/bin/bash
YAY=$(pacman -Qsq yay)

case $1 in
	"install" | "i")
		sudo pacman -S --needed --noconfirm git base-devel
		if [ "$YAY" == "" ]; then
			echo "=== Yay is not installed on system. Installing it ==="
			git clone https://aur.archlinux.org/yay-bin.git
			cd yay-bin
			makepkg -sri --noconfirm
			cd ../
			echo "=== Done installing yay ==="
		fi
		echo "=== Installing vim, tmux, powerline and airline =="
		yay -S --needed --noconfirm vim tmux powerline powerline-fonts-git vim-airline
		echo "=== Installing Vundle ==="
		 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		vim +PluginInstall +qall
		echo "=== Done installing everything! run ./install apply to apply configurations ==="
		echo "=== Copying local scripts!==="
		cp -r /bin ~/.local/bin
	;;
	"apply" | "a")
		mv ~/.vimrc ./vimrc.old
		mv ~/.tmux.conf ./tmux.conf.old
		cp ./vimrc ~/.vimrc
		cp ./tmux.conf ~/.tmux.conf
	;;
	"reset" | "r")
		mv ./vimrc.old ~/.vimrc
		mv ./tmux.conf.old ~/.tmux.conf
	;;
	*)
		echo "install [(i)nstall | (a)ppy | (r)eset ]"
	;;
esac
