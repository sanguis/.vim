" Vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'vim-syntastic/syntastic'
  Plugin 'mhinz/vim-signify'
  Plugin 'tomtom/tlib_vim'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tpope/vim-fugitive'
  Plugin 'walm/jshint.vim.git'
  Plugin 'leshill/vim-json'
  Plugin 'Raimondi/delimitMate'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'hallison/vim-markdown'
  Plugin 'SirVer/ultisnips'
  Plugin 'avakhov/vim-yaml'
  Plugin 'chase/vim-ansible-yaml'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'honza/vim-snippets'
  Plugin 'm-kat/aws-vim'
  Plugin 'hashivim/vim-terraform'
  Plugin 'juliosueiras/vim-terraform-completion'

call vundle#end()            " required

set smartcase " match 'word' case-insensitive and 'Word' case-sensitive
set showmatch " shows matching parenthesis, bracket, or brace
set showcmd " show commands while they're being typed
set incsearch " searches as you type
syntax on " syntax highlighing
set background=dark " adapt colors for background
:colorscheme desert
set vb t_vb=
set nowrap
setlocal spell spelllang=en_us
filetype plugin on " plugins are enabled
set noswapfile
set ruler
set wildmode=longest,list,full
set wildmenu
:filetype indent on
set number
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set isk-=_ "adds underscores as a word break
:let g:proj_flags="imstvcg"

" generl key bindings
nmap <F8> :TagbarToggle<CR>
" force save if you forgot to open with sudo
cmap w!! %!sudo tee > /dev/null %
" search for visualized text
vnoremap // y/<C-R>"<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

"Neocomplete settings
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>""

" UltiSnips

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Chef development
nmap <F7> :set filetype=ruby.eruby.chef<CR>

" Aws development vim-aws functions
let g:AWSVimValidate = 1

" js/ jquery development
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" json dev
au BufRead,BufNewFile *.json set filetype=json

" Drupal Development.
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
  augroup END
endif

nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
let g:syntastic_phpcs_conf=" --standard=DrupalCodingStandard --extensions=php,module,inc,install,test,profile,theme"
let g:syntastic_auto_loc_list=1
