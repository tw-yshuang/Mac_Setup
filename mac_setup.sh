#!/usr/bin/env zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
echo 'FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew install wget git vim curl wget make tmux

brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask appcleaner
brew install --cask vlc
brew install --cask cheatsheet
brew install --cask hiddenbar
brew install --cask iterm2
brew install --cask karabiner-elements
brew install --cask anydesk

sh -c "$(wget -qO- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
zsh ./ohmyzsh_config.sh

brew install pyenv
brew_path='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
echo "# pyenv setting\nalias brew='$brew_path'" >> ~/.zprofile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo '# pyenv setting\neval "$(pyenv init -)"' >> ~/.zshrc

brew install pipenv

zsh ./custom_functions.sh

/usr/libexec/PlistBuddy -c 'Add :LSUIElement bool true' /Applications/Hidden\ Bar.app/Contents/Info.plist
