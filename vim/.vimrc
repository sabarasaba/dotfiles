" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')

" the plugins I cant live without
Plug 'morhetz/gruvbox'
Plug 'janko-m/vim-test'
Plug 'hauleth/blame.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ewilazarus/preto'
Plug 'mxw/vim-jsx'
Plug 'Valloric/MatchTagAlways'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sleuth'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vitalk/vim-simple-todo'
Plug 'AndrewRadev/splitjoin.vim'
"Plug 'vim-scripts/YankRing.vim'
Plug 'vimwiki/vimwiki'
Plug 'sbdchd/neoformat'
Plug 'nelstrom/vim-visual-star-search'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Setup FZF toggles
nnoremap <c-p> :Files<CR>
map <leader>b :Buffers<CR>

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on


" Enable spellchecking for Markdown files and git commit messages
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType css,less,pss,sss set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.css   set syntax=css
autocmd BufNewFile,BufRead *.php   set nocursorline
autocmd BufRead,BufNewFile *.conf setfiletype conf
au BufRead,BufNewFile *.pss setfiletype css
au BufRead,BufNewFile *.sss setfiletype css
au FocusLost,WinLeave * :silent! w

set laststatus=2
set number            " Show line numbers
set ruler             " Show line and column number
set encoding=utf-8    " Set default encoding to UTF-8
set backspace=2
set nocursorline        " Show cursor line
set colorcolumn=80

" Disable swap files
set nobackup
set noswapfile


set t_Co=256
set ttyfast " u got a fast terminal
"set ttyscroll=3
"set lazyredraw " to avoid scrolling problems


set visualbell           " don't beep
set noerrorbells         " don't beep
set noeb vb t_vb=

" Share clipboard with osx
set clipboard=unnamed

" Syntax coloring
set synmaxcol=200
syntax enable
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

" Custom visual cues
hi Visual cterm=NONE ctermbg=White ctermfg=Black
hi Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
hi MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen

" Comments should be italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

" Ignore comonly unused files
set wildignore+=*/tmp/*,*/node_modules/*,*/frontend/node_modules/*,*/backend/node_modules/*,*.DS_Store,*.swp,*.zip     " MacOSX/Linux

""
"" Whitespace
""
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set softtabstop=2
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Saner splits
""
set splitbelow
set splitright

" Saner undo key
noremap U <C-R>

" Disable dict
map <S-k> <Nop>

" Sharing splits config with tmux
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Use , as leader key :D
let mapleader = ","

" Configure the silver searcher
" let g:ag_prg="ag --ignore node_modules --ignore yarn.lock -i --column"
" nnoremap \ :Ag<SPACE>
" let g:rg_highlight=1
" nnoremap \ :Rg<SPACE>--ignore-case<SPACE>
if executable('ag')
  let g:ackprg = 'ag --ignore-case --ignore yarn.lock --ignore-dir node_modules --vimgrep'
endif
nnoremap \ :Ack<SPACE>

" Trigger git status from vim-fugitive
nmap <leader>gs :Gstatus<cr>
" Retabs the current buffer and fixes its indentation
nmap <leader>fi :set et<cr>:retab<cr>
" Custom mapping for easymotion
map s <Plug>(easymotion-s2)
" Disable currently higlighted stuff
map <leader><space> :noh<cr>

set guioptions-=L

""
"" Because Im stupid
""
:command WQ wq
:command Wq wq
:command Qa qa!
:command QA QA
:command W w
:command Q q
:command Vs vs
:command E e
:command Tabe tabe
cnoreabbrev X x

" Highlight closing tags for JSX
highlight link xmlEndTag xmlTag

" JSX should not be required as an extension
let g:jsx_ext_required = 0

" Emmet setup
let g:user_emmet_expandabbr_key = '<c-j>'
let g:user_emmet_settings = { 'indentation' : ' ' }
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

let g:mta_filetypes = {
\ 'javascript.jsx': 1,
\ 'html' : 1,
\}


" Setup nerdtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.rdb$', '\.DS_Store']

" Add an extra space after comment delimiter
let g:NERDSpaceDelims = 1

" Setup ultisnips and use tab as a completition key
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Create a custom JSON parsing command
command JsonParse execute '%!python -m json.tool' | w
map <leader>j JsonParse

" Setup yarnk-ring
let g:yankring_replace_n_pkey = '<C-n>'
let g:yankring_replace_n_nkey = '<C-b>'

set guioptions-=r
set guioptions-=r
"set showtabline=0

" yank directly into systems clipboard
" noremap y "+yy
" noremap p "+p


" Setup FZF toggles
nnoremap <c-p> :Files<CR>
map <leader>b :Buffers<CR>

" Paste indented ]p or ]P
" fzf.vim ctrl-V will open in split
" <C-n> and <C-b> will trigger yakn ring
" <leader>-ww will trigger vimwiki
" gS at the beggining of the line will format code and tab code
"   eg: const { h, b, c } = this.props
"ctrl+n+b
