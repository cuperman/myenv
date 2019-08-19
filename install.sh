#!/bin/bash

function checkInstall() {
    loc=`which $1`
    if [ "$?" != "0" ]; then
        echo
        echo "$1 NOT found, install with '$2'"
    else
        echo -n "✓"
    fi
}

echo "Ensure Homebrew is installed"
checkInstall brew "/usr/bin/ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
echo

echo "Update Homebrew"
brew update

echo "Cask install Quick Look plugins"
# Reference: https://github.com/sindresorhus/quick-look-plugins
brew cask install \
    qlcolorcode \
    qlstephen \
    qlmarkdown \
    quicklook-json \
    qlprettypatch \
    quicklook-csv \
    betterzip \
    webpquicklook \
    suspicious-package

echo "Cask install applications"
brew cask install \
    alfred \
    caffeine \
    dropbox \
    google-chrome \
    1password6 \
    visual-studio-code \
    iterm2

# More app suggestions
# https://sourabhbajaj.com/mac-setup/Homebrew/Cask.html

echo "Brew install CLI tools"
brew install \
    zsh \
    tree \
    fzf \
    ack \
    bash-completion

echo "Done"
