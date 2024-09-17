#! /usr/bin/bash

if ! type brew > /dev/null 2>&1; then
  echo "Homebrew not found, installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Homebrew exists, skipping installing"

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

PACKAGES=(
  # "asdf"
  "dive"
  "fzf"
  "gcc"
  "git"
  "make"
  "neovim"
  "jq"
  "ripgrep"
  "zsh"
  "lazygit"
  "tmux"
  "ngrok"
  "alacrity"
  "font-fira-mono-nerd-font"
  "ngrok"
  "redis"
  "bat"
)

if [[ -f ./Brewfile ]]; then
  echo "Brewfile found, installing packages with from it"
  brew bundle install --file=Brewfile
else 
  echo "Brewfile not found, install following packages..."
  echo "$PACKAGES[@],$PACKAGES[@]"

  brew_list=$(brew list --formulae -1)

  for pkg in "${PACKAGES[@]}"
  do
    if ! echo "$brew_list" | grep -q "$pkg"; then
      echo "installing $pkg..."
      brew install $pkg
    fi
  done
fi

echo "all packages installed"
