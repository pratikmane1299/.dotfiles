#!/usr/bin/bash


os=$(uname)

case $os in
	"Darwin")
		 
	mkdir -p ~/.config/alacritty/themes
	git clone https://github.com/alacritty/alacritty-theme/ ~/.config/alacritty/themes
esac

