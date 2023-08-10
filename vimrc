" Requires pip module pynvim to be installed.

" SECTION: Call plugins with vim/plugged {{{1
call plug#begin('~/.vim/plugged')
  " SECTION: NeoVim Back Porters {{{2
  Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }
  Plug 'roxma/vim-hug-neovim-rpc'

  " SECTION: AI_helpers {{{2
  Plug 'github/copilot.vim'

  " SECTION: Source control Utilities {{{2
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'

  " SECTION: Syntax and Linting {{{2
  Plug 'vim-syntastic/syntastic'
  Plug 'w0rp/ale'

  " SECTION: Completion and snippets {{{2
  "Plug 'autozimu/LanguageClient
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'juliosueiras/vim-terraform-completion'
  Plug 'reconquest/vim-pythonx'
  Plug 'thomasfaingnaert/vim-lsp-snippets'
  Plug 'thomasfaingnaert/vim-lsp-ultisnips'
  Plug 'wellle/tmux-complete.vim'
  Plug 'Shougo/deoplete.nvim'

  " SECTION: Code Language Syntax help {{{2
  Plug 'avakhov/vim-yaml'
  Plug 'cespare/vim-toml'
  Plug 'chr4/nginx.vim'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'fatih/vim-go'
  Plug 'hallison/vim-markdown'
  Plug 'hashivim/vim-terraform'
  Plug 'leshill/vim-json'
  Plug 'lvht/tagbar-markdown'
  Plug 'pearofducks/ansible-vim'
  Plug 'pedrohdz/vim-yaml-folds'
  Plug 'rhysd/vim-grammarous'
  Plug 'rodjek/vim-puppet'
  Plug 'sanguis/jenkinsfile-snippets'
  Plug 'sanguis/vim-helm'
  Plug 'thecodesmith/vim-groovy'
  Plug 'https://bitbucket.org/sw-samuraj/vim-gradle/src/develop/'
  Plug 'parkr/vim-jekyll'
  Plug 'vim-ruby/vim-ruby'
  Plug 'vim-scripts/groovyindent-unix'

  " SECTION: UX help {{{2
  Plug 'Yggdroot/indentLine'
  Plug 'bling/vim-airline'
  Plug 'frazrepo/vim-rainbow'
  Plug 'junegunn/fzf.vim'
  Plug 'majutsushi/tagbar'
  Plug 'scrooloose/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-scripts/FuzzyFinder'

  " SECTION: Unsorted plugins {{{2
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'vim-scripts/l9'

  " SECTION: Utilities {{{2
  Plug 'dhruvasagar/vim-open-url'
  Plug 'CrispyDrone/vim-tasks'
  Plug 'tpope/vim-surround'
  "
  " SECTION: Work Utilities {{{2
  Plug 'sanguis/vim-generify'
  " SECTION: Vim Applications. {{{2 {{{2
  Plug 'paulkass/jira-vim', { 'do': 'pip install -r requirements.txt' }


call plug#end()

" SECTION: # Appearance/UI {{{1
colorscheme evening
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'
let g:airline#extensions#tabline#enabled = 1
syntax on " syntax highlighting
set number
let g:rainbow_active = 1

" ## GUI Only Settings
if has('gui_running')
  set guifont=Roboto\ Mono\ for\ Powerline:h11.
  se guioptions-=m  "remove menu bar
  se guioptions-=T  "remove toolbar
  se guioptions-=r  "remove right-hand scroll bar
  se guioptions-=L  "remove left-hand scroll bar
endif

" ## Spelling highlight settings
"" Force to use underline for spell check
set spell
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
        \ highlight clear SpellBad
        \ highlight SpellBad cterm=underline
        \ highlight SpellBad gui=undercurl
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

" Search settings
set smartcase " match 'word' case-insensitive and 'Word' case-sensitive
set showmatch " shows matching parenthesis, bracket, or brace
set showcmd " show commands while they're being typed
set incsearch " searches as you type
"
" # miscellaneous settings
" TODO Split these setting up in to better sections where possible
set visualbell t_vb=
set nowrap
filetype plugin on " plugins are enabled
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
set ruler
set path=$PWD/**        " SECTION: enable fuzzy finding in the vim command line {{{2
set runtimepath+=/usr/local/opt/fzf
set wildmode=longest,list,full
set wildmenu
set wildignore+=**/.git/**,**/__pycache__/**,**/venv/**,**/node_modules/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp
filetype indent on
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set iskeyword-=_ "adds underscores as a word break
let g:proj_flags='imstvcg'
set shell=/bin/bash " Ignore my crazy zsh stuff and use bash
set autochdir " automatically change to the working dir of the file in the buffer"
set diffopt+=vertical " prefer vertical orientation when using :diffsplit
set mousemodel=popup

" ## hit F9 to reload the vimrc
nmap <F9> :source ~/.vim/vimrc<CR>
" ## unmap the arrows
" Cycle through the history using C-n and C-p (Ctrl+n and Ctrl+p, respectively).
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Tagbar Toggleing
nmap <F8> :TagbarToggle<CR>
" general key bindings
nnoremap nt :NERDTreeToggle<CR>
" force save if you forgot to open with sudo
cmap w!! %!sudo tee > /dev/null %
" search for visualized text
vnoremap // y/<C-R>"<CR>
"List buffers and select one by number

vnoremap /d y:silent !open https:\/\/www.duckduckgo.com\/?q=<C-R>"<CR>


" # Syntastic

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
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
" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w}]'
"call deoplete#custom#source('ultisnips','LanguageClient', 'ale', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('ultisnips', 'ale', 'matchers', ['matcher_fuzzy'])
call deoplete#initialize()

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Open Help files vertically on the left
augroup help
  autocmd FileType help wincmd L
augroup END:

" # Per Language Settings
" Chef development
nmap <F7> :set filetype=ruby.eruby.chef<CR>

augroup awsconfig
  " SECTION: Aws development vim-aws functions {{{2
  let g:AWSVimValidate = 1
  au BufRead,BufNewFile ~/.aws/credentials set filetype=toml
  au BufRead,BufNewFile ~/.aws/config set filetype=toml
augroup END

" js/ jquery development
augroup js
  au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
augroup END

" json dev
augroup json
  au BufRead,BufNewFile *.json set filetype=json
augroup END

"yaml development
augroup yaml
  let g:tagbar_type_yaml = {
        \ 'ctagstype' : 'yaml',
        \ 'kinds' : [
          \ 'a:anchors',
          \ 's:section',
          \ 'e:entry'
          \ ],
          \ 'sro' : '.',
          \ 'scope2kind': {
            \ 'section': 's',
            \ 'entry': 'e'
            \ },
            \ 'kind2scope': {
              \ 's': 'section',
              \ 'e': 'entry'
              \ },
              \ 'sort' : 0
              \ }
augroup END
" Ansible Development
augroup Ansible
  au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
augroup END

" Terraform development
augroup terraform
  au BufRead,BufNewFile *.tf-vars set filetype=terraform
  au BufReadCmd,FileWritePre FileType terraform TerraformFmt
augroup END

" zsh stuff
augroup zsh
  autocmd!
  autocmd BufRead,BufNewFile .zsh set filetype=sh.zsh
augroup END

" Drupal Development.
if has('autocmd')
  " SECTION: Drupal *.module and *.install files. {{{2
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
  augroup END
endif

nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>
let g:syntastic_phpcs_conf=' --standard=DrupalCodingStandard --extensions=php,module,inc,install,test,profile,theme'
let g:syntastic_auto_loc_list=1
" let g:syntastic_yaml_checkers = ['yamllint']


" git commit settings
augroup git
  au FileType gitcommit 1 | startinsert
augroup END

"Jenkinsfile auto syntax checking as groovy
augroup Jenkinsfile
  au BufNewFile,BufRead Jenkinsfile setf groovy
augroup END

if !empty($jiraVimDomainName)
  let g:jiraVimDomainName = $jiraVimDomainName
  let g:jiraVimEmail = $jiraVimEmail
  let g:jiraVimToken = $jiraVimToken

endif

" SECTION: Custom functions {{{(1

" SECTION: TURN off Spelling in the background {{{(2
function! TempNoSpell(time = "60")
  echo 'Spelling will be off for' a:time 'seconds'
  set nospell
  !sleep a:time
  set spell
endfunction

nnoremap <f3> :call TempNoSpell(120)<CR>

" SECTION: open scratchpad {{{(2
function! Scratch(type = "txt")
  vs /tmp/vim-scratch.a.type
endfunction

let  maark_generify = {
      \ 'example': '[maark|Maark]',
      \ 'monkey_do': '[maestro|cps]',
      \ 'us-region-23': '[us|eu]-[east|west]-\d\+',
      \ '12345678909': '\d\{11\}'
      \}

function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText !=# ''
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()
