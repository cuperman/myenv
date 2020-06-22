#!/bin/zsh

set -e

if [ ! -x "$(command -v brew)" ]; then
    >&2 echo "Homebrew required"
    exit 1
fi

echo "Install Node Version Manager (NVM)"
brew install nvm

echo "Create NVM working directory"
mkdir -p ~/.nvm

echo "Add NVM configuration to zsh"
echo "" >> ~/.zsh_extras
echo "# Load node.js version manager (nvm)" >> ~/.zsh_extras
echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.zsh_extras
echo "[ -s \"/usr/local/opt/nvm/nvm.sh\" ] && . \"/usr/local/opt/nvm/nvm.sh\"  # This loads nvm" >> ~/.zsh_extras
echo "[ -s \"/usr/local/opt/nvm/etc/bash_completion.d/nvm\" ] && . \"/usr/local/opt/nvm/etc/bash_completion.d/nvm\"  # This loads nvm bash_completion" >> ~/.zsh_extras

echo "Done"
