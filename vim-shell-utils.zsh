#!/usr/bin/env zsh
export VIMRC=$HOME/.sanguis_settings/vim/vimrc


## referenced by zshrc, contains functions for vim config editing
# edit and commit changed to vimrc
vimrc_edit() {

  local pre_count=$(grep -cE '^\s+Plug' $VIMRC)
  [[ $DEBUG ]] && echo -e "\033[34;1m[DEBUG]\033[0m Before editing there are $pre_count plugins listed referenced"
  vim $VIMRC
  git -C $HOME/.sanguis_settings/vim commit $VIMRC
  local post_count=$(grep -cE '^\s+Plug' $VIMRC)
  [[ $DEBUG ]] && echo -e "\033[34;1m[DEBUG]\033[0m After editing there are $post_count plugins listed referenced"
  [[ $post_count != $pre_count ]] && vim +PlugInstall +PlugUpdate +PlugClean +qall
}

vim_plug_update() {
  # function_body
  curl -fLo $VIMRC/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

}
