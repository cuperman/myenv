#!/bin/bash

echo "Ensure Homebrew is installed"
if [ ! -x "$(command -v brew)" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "✓"
fi

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
    tree \
    fzf \
    ack \
    bash-completion

echo "Ensure Oh My Zsh is installed"
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo "✓"
fi

cd ~
for file in .zshrc .zsh_extras; do
    if [ -h $file ] ; then
        # File is already a symbolic link
        echo "Symlink for $file is already there"
        continue
    fi
    if [ -d $file -o -f $file ] ; then
        echo "Backing up existing $file to $file.b4myenv"
        rm -rf $file.b4myenv
        mv $file $file.b4myenv
    fi
    echo "Creating symlink for $file"
    ln -s ~/.myenv/home/$file
done

echo "Done"
