#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if grep -q DOTFILES_FOLDER ~/.bashrc; then
    echo "dotfiles loader already in .bashrc - skipping"
else
    echo "Adding dotfiles loader to .bashrc..."
    echo -e "# DOTFILES_START" >> ~/.bashrc
    echo -e "DOTFILES_FOLDER=\"$DIR\"" >> ~/.bashrc
    echo -e "source \"$DIR/load.sh\"" >> ~/.bashrc
    echo -e "# DOTFILES_END\n" >> ~/.bashrc
fi

# Ensure socat is installed in container
if [[ $(command -v socat > /dev/null; echo $?) == 1 ]]; then
    echo "Installing socat"
    sudo apt update && sudo apt install -y socat
fi
