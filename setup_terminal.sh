#!/bin/zsh

set -e

if [ ! -x "$(command -v brew)" ]; then
    >&2 echo "Homebrew required"
    exit 1
fi

echo "Install iterm2"
brew cask install iterm2

echo "Install useful CLI tools"
brew install \
    tree \
    fzf \
    ack \
    bash-completion

echo "Ensure Oh My Zsh is installed"
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "✓"
fi

echo "Create ~/.zsh_extras"
if [ ! -f ~/.zsh_extras ]; then
    touch ~/.zsh_extras
    echo "" >> ~/.zshrc
    echo "# Load additional customizations" >> ~/.zshrc
    echo "source ~/.zsh_extras" >> ~/.zshrc
fi

echo "Done"
echo "Customize zsh by editing ~/.zshrc or adding new configurations to ~/.zsh_extras"
