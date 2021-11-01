#!/usr/bin/env zsh
export VIMRC=$HOME/.sanguis_settings/vim/vimrc


## refrenced by zshrc, contains funtions for vimconfig editing
# edit and commit changed to vimrc
vimrc_edit() {
  vim $VIMRC
  git -C $HOME/.sanguis_settings/vim commit $VIMRC
  vim +PlugInstall +PlugUpdate +qall
}

vim_plug_update() {
  # function_body
  curl -fLo $VIMRC/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

}
