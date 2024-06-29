#!/usr/bin/bash

os=$(uname)

echo $os

case $os in
	#TODO: add support for linux
	# "Linux")
		# echo "installing packages for linux" ;;
	"Darwin")
		sh ./macos/setup-brew.sh ;;
esac

