#!/usr/bin/env zsh
## refrenced by zshrc, contains funtions for vimconfig editing
# edit and commit changed to vimrc
vimrc_edit() {
  VIMRC=$HOME/.sanguis_settings/vim/vimrc
  vim $VIMRC
  git -C $HOME/.sanguis_settings/vim commit $VIMRC
  vim +PluginInstall +PluginUpdate +qall
}
