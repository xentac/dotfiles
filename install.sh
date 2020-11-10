#!/bin/sh
mkdir -p $HOME/.config/i3
rm $HOME/.config/i3/config
ln -s $(pwd)/i3-config $HOME/.config/i3/config

rm $HOME/.i3blocks.conf
ln -s $(pwd)/i3blocks.conf $HOME/.i3blocks.conf

rm $HOME/.tmux.conf
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf

rm -rf $HOME/.tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && $HOME/.tmux/plugins/tpm/bin/install_plugins

rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim
ln -s $(pwd)/init.vim $HOME/.config/nvim/init.vim

git clone https://github.com/k-takata/minpac.git $HOME/.config/nvim/pack/minpac/opt/minpac
nvim --headless +PackUpdateAndQuit +q
