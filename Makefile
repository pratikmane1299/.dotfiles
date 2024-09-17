install:
	./install

link:
	./install --only link

install-vscode-exts:
	cat ~/.dotfiles/vscode/extensions.txt | xargs -L 1 code --install-extension

save-vscode-exts:
	code --list-extensions > ~/.dotfiles/vscode/extensions.txt

generate-brewfile:
	brew bundle dump -f --file=macos/Brewfile
	brew bundle --force cleanup --file=macos/Brewfile

setup-alacritty:
	sh setup-alacritty.sh

