" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'sheerun/vim-polyglot'
Plug 'pantharshit00/vim-prisma'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sleuth'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vimwiki/vimwiki'
Plug 'nelstrom/vim-visual-star-search'
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plug 'Valloric/MatchTagAlways'
" Plug 'easymotion/vim-easymotion'
" Plug 'vitalk/vim-simple-todo'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on


" Enable spellchecking for Markdown files and git commit messages
autocmd FileType markdown setlocal spell
autocmd FileType wiki setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType css,less,pss,sss set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.css   set syntax=css
autocmd BufRead,BufNewFile *.conf setfiletype conf
au BufRead,BufNewFile *.pss setfiletype css
au BufRead,BufNewFile *.sss setfiletype css

" Theme
if (has("termguicolors"))
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 set termguicolors
endif

syntax on
set t_Co=256
set ttyfast
set cursorline
colorscheme onehalfdark


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


set visualbell           " don't beep
set noerrorbells         " don't beep
set noeb vb t_vb=

" Share clipboard with osx
set clipboard=unnamed


" Custom visual cues
hi Visual cterm=NONE ctermbg=White ctermfg=Black
hi Search ctermfg=Yellow ctermbg=NONE guifg=wheat guibg=red cterm=bold,underline
hi MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen

" Comments should be italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic

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

map <leader><space> :noh<cr>


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

" Setup nerdtree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.rdb$', '\.DS_Store']

" Add an extra space after comment delimiter
let g:NERDSpaceDelims = 1
let g:NERDTreeIgnore = ['^node_modules$']
nmap <leader>gs :Gstatus<cr>

" Setup FZF toggles
nnoremap <c-p> :Files<CR>
map <leader>b :Buffers<CR>

" Editor config
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

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

" Multiple cursors
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1

" Attempt to fix ale + multiple-cursors bug
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0


" Configure the rg searcher
" nnoremap \ :Rg<ENTER>
" let g:fzf_preview_window = ''
if executable('ag')
  let g:ackprg = 'ag --ignore-case --ignore yarn.lock --ignore-dir node_modules --vimgrep'
endif
nnoremap \ :Ack<SPACE>

" Setup ultisnips and use tab as a completition key
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["~/.vim/custom_snippets"]
