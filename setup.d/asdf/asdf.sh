#! /bin/bash

git clone https://github.com/asdf-vm/asdf.git "$HOME/git/asdf" --branch v0.7.6

ln -sfn "$HOME/git/asdf" "$HOME/.asdf"

exit 0
