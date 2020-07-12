#!/bin/zsh

set -e

if [ ! -x "$(command -v brew)" ]; then
    >&2 echo "Homebrew required"
    exit 1
fi

echo "Install Python Version & Dependency Management (pyenv + pipenv)"
brew install pyenv pipenv

echo "Add pyenv configuration to zsh"
echo "" >> ~/.zsh_extras
echo "# Load python version manager (pyenv)" >> ~/.zsh_extras
echo "eval \"\$(pyenv init -)\"" >> ~/.zsh_extras

echo "Done"
