#!/bin/sh
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf

ln -s $(pwd)/inputrc $HOME/.inputrc

rm -rf $HOME/.tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && $HOME/.tmux/plugins/tpm/bin/install_plugins
