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

echo "Install Python environment"
# Reference: https://hackernoon.com/reaching-python-development-nirvana-bb5692adf30c
brew install pyenv
eval "$(pyenv init -)"
PYTHON_VERSION=3.7.4
if [[ $(pyenv versions) != *$PYTHON_VERSION* ]]; then
    pyenv install $PYTHON_VERSION
    pyenv global $PYTHON_VERSION
else
    echo "Python $PYTHON_VERSION already installed."
fi
pip install --user pipenv

echo "Link to dot files in ~"
cd ~/.myenv/home
find . -type f | sed "s|^\./||" | while read file; do
    targetdir=$(dirname ~/"$file")
    targetfile=$(basename "$file")
    sourcepath=~/.myenv/home/"$file"

    cd "$targetdir"
    if [ -h "$targetfile" ] ; then
        # File is already a symbolic link
        echo "Symlink for \"$targetfile\" is already there"
        continue
    fi
    if [ -d "$targetfile" -o -f "$targetfile" ] ; then
        echo "Backing up existing \"$targetfile\" to \"$targetfile\".b4myenv"
        rm -rf "$targetfile".b4myenv
        mv "$targetfile" "$targetfile".b4myenv
    fi
    echo "Creating symlink for \"$targetfile\""
    ln -s "$sourcepath"
done

echo "Done"
