" Vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " NeoVim Back Porters
  Plugin 'roxma/vim-hug-neovim-rpc'
  Plugin 'roxma/nvim-yarp'

  " Development Utilities
  Plugin 'tpope/vim-fugitive'
  " Plugin 'vim-syntastic/syntastic' trying out ale solo for a bit
  Plugin 'w0rp/ale'

  " Completion and snippets
  Plugin 'Raimondi/delimitMate'
  Plugin 'SirVer/ultisnips'
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'honza/vim-snippets'
  Plugin 'juliosueiras/vim-terraform-completion'
  Plugin 'm-kat/aws-vim'

  " Language Syntax help
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'hallison/vim-markdown'
  Plugin 'hashivim/vim-terraform'
  Plugin 'ekalinin/Dockerfile.vim'
  Plugin 'fatih/vim-go'
  Plugin 'cespare/vim-toml'
  Plugin 'pearofducks/ansible-vim'
  Plugin 'avakhov/vim-yaml'
  Plugin 'leshill/vim-json'

  " UX help
  Plugin 'vim-scripts/FuzzyFinder'
  Plugin 'scrooloose/nerdtree'
  Plugin 'kien/ctrlp.vim'
  Plugin 'junegunn/fzf.vim'

  " Unsorted plugins
  Plugin 'vim-scripts/l9'
  Plugin 'mhinz/vim-signify'
  Plugin 'tomtom/tlib_vim'
  Plugin 'MarcWeber/vim-addon-mw-utils'

call vundle#end()            " required

" set powerline
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" Powerline fonts
if has('gui_running')
  set guifont=hack:h11
endif

" general settings
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
set noswapfile"
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
set shell=/bin/bash " Ignore my crazy zsh stuff and use bash
set autochdir " automatically change to the working dir of the file in the buffer"

" unmap the arrows
" Cycle through the history using C-n and C-p (Ctrl+n and Ctrl+p, respectively).
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" fuzy file finding
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" general key bindings
nnoremap nt :NERDTreeToggle<CR>
" force save if you forgot to open with sudo
cmap w!! %!sudo tee > /dev/null %
" search for visualized text
vnoremap // y/<C-R>"<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

"search in duckduckgo via firefox for visualized text.
vnoremap /d y:silent !open -a Firefox https:\/\/www.duckduckgo.com\/?q=<C-R>"<CR>

" Ale Linting Settings
" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" use nice symbols for errors and warnings
let g:ale_sign_error = '✗\ '
let g:ale_sign_warning = '⚠\ '

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

"
let g:acp_enableAtStartup = 0

let g:deoplete#enable_at_startup = 1

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

" Ansible Development
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

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
" let g:syntastic_yaml_checkers = ['yamllint']

:function! TempSpell(time)
:  echo "Spelling will be on for" a:time "seconds"
:  set spell
:  sleep
:  set nospell
:endfunction

nnoremap <f3> :call TempSpell(5)<CR>
