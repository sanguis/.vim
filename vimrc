" USE
" Requires pip module pynvim to be installed.
"
" Vundle plugins
set nocompatible              " be iMproved, required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " NeoVim Back Porters
  Plugin 'roxma/vim-hug-neovim-rpc'
  Plugin 'roxma/nvim-yarp'

  " Source control Utilities
  Plugin 'tpope/vim-fugitive'
  Plugin 'mhinz/vim-signify'

  " Syntax and Linting
  " Plugin 'vim-syntastic/syntastic' "trying out ale solo for a bit
  Plugin 'w0rp/ale'

  " Completion and snippets
  Plugin 'Raimondi/delimitMate'
  Plugin 'SirVer/ultisnips'
  Plugin 'Shougo/deoplete.nvim'
  " Plugin 'Shougo/neosnippet.vim'
  " Plugin 'Shougo/neosnippet-snippets'
  Plugin 'honza/vim-snippets'
  Plugin 'juliosueiras/vim-terraform-completion'
  Plugin 'm-kat/aws-vim'
  Plugin 'wellle/tmux-complete.vim'

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
  Plugin 'rodjek/vim-puppet'
  Plugin 'towolf/vim-helm'
  Plugin 'vim-scripts/groovy.vim'
  Plugin 'groovyindent-unix'

  " UX help
  Plugin 'vim-scripts/FuzzyFinder'
  Plugin 'scrooloose/nerdtree'
  Plugin 'kien/ctrlp.vim'
  Plugin 'junegunn/fzf.vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'Yggdroot/indentLine'

  " Unsorted plugins
  Plugin 'vim-scripts/l9'
  Plugin 'tomtom/tlib_vim'
  Plugin 'MarcWeber/vim-addon-mw-utils'

  " Utilites
  Plugin 'CrispyDrone/vim-tasks'

call vundle#end()            " required
filetype plugin indent on    " required

" set powerline
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" Powerline fonts
if has('gui_running')
  set guifont=hack:h11
endif

" general setting
"
" Force to use underline for spell check results
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
        \ highlight clear SpellBad
  autocmd ColorScheme *
        \ highlight SpellBad
        \   cterm=Underline
        \   ctermfg=NONE
        \   ctermbg=NONE
        \   term=Reverse
        \   gui=Undercurl
        \   guisp=Red
  autocmd ColorScheme *
        \ highlight SpellCap
        \   cterm=Underline
        \   ctermfg=NONE
        \   ctermbg=NONE
        \   term=Reverse
        \   gui=Undercurl
        \   guisp=Red
  autocmd ColorScheme *
        \ highlight SpellLocal
        \   cterm=Underline
        \   ctermfg=NONE
        \   ctermbg=NONE
        \   term=Reverse
        \   gui=Undercurl
        \   guisp=Red
  autocmd ColorScheme *
        \ highlight SpellRare
        \   cterm=Underline
        \   ctermfg=NONE
        \   ctermbg=NONE
        \   term=Reverse
        \   gui=Undercurl
        \   guisp=Red
augroup END

colorscheme desert
" set background dark
set smartcase " match 'word' case-insensitive and 'Word' case-sensitive
set showmatch " shows matching parenthesis, bracket, or brace
set showcmd " show commands while they're being typed
set incsearch " searches as you type
syntax on " syntax highlighing
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
" set diffopt+=vertical " prefer vertical orientation when using :diffsplit

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

" fuzzy file finding
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

" Add comment out with #
" vnoremap # :'<,'>s/^/#/<CR>
" Ale Linting Settings
" fix files on save
let g:ale_fix_on_save = 1

" lint after 1000ms after changes are made both on insert mode and normal mode
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 1000

" use nice symbols for errors and warnings
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" fixer configurations
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:acp_enableAtStartup = 0

" auto Completion and snippets.
let g:deoplete#enable_at_startup = 1
 call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
" imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
" inoremap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>"

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" base64 utills TO-1DO
" vnoremap <leader>d64 c<c-r>=system('base64 --decode', @")<cr><esc>
" vnoremap <leader>c64 c<c-r>=system('base64', @")<cr><esc>

" Chef development
nmap <F7> :set filetype=ruby.eruby.chef<CR>

" Aws development vim-aws functions
let g:AWSVimValidate = 1

" Markdown
au BufRead,BufNewFile *.md set wrap
" js/ jquery development
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" json dev
au BufRead,BufNewFile *.json set filetype=json

" Ansible Development
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

" todo list options
autocmd Filetype tasks let maplocalleader="\<space>"
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

" git commit settings
au FileType gitcommit 1 | startinsert

"Jenkinsfile auto sytach checking
au BufNewFile,BufRead Jenkinsfile setf groovy
