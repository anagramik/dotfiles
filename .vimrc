" Put at the very end of your .vimrc file.
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

" updatetome = 750

function PhpSyntaxOverride()
    hi! def link phpDocTags  ihpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END

set nocompatible
" scriptencoding utf-8  
" Set scriptencoding to utf-8 (listchars)"

" ================ Vundle  ====================

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Gui plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kien/ctrlp.vim'

" Search and movement
Plugin 'mileszs/ack.vim'

" Code edit
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/webapi-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/goyo.vim'

" PHP 
 Plugin 'StanAngeloff/php.vim'

" Autocomplete and sinppets
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" Git and command line
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'thinca/vim-quickrun'

" Syntax highlight
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
" Plugin 'digitaltoad/vim-jade'

" Color schemes
Plugin 'kristijanhusak/vim-hybrid-material'
" Plugin 'whatyouhide/vim-gotham'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" =============== Color Schemes ====================
set t_Co=256
set background=dark
" highlight clear SignColumn
colorscheme hybrid_reverse 
" let g:hybrid_use_iTerm_colors = 1"

" ================ General Config ====================

set mouse=a                     "Enable mouse
set title                       "Change the terminal's title
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set smartcase                   "Smart case search if there is uppercase
set cursorline                  "Highlight current line
set showmatch                   "Highlight matching bracket
set ignorecase                  "No case sensitivity
set hlsearch                    "Highlight search term
set incsearch                   "Jump to found term while searching
set showmatch                   "Highlight matching bracket
set shortmess=atI               " Don’t show the intro message when starting Vim
" set spell


" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Overwrite ESC
inoremap jk <ESC>

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
" let mapleader=","
let mapleader="\<Space>"


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set autoindent                  " Indent at the same level of the previous line"
set nowrap                      " Don't wrap lines
set linebreak                   " Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent           " fold based on indent
set foldnestmax=3               " deepest fold is 3 levels
set nofoldenable                " don't fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                    " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=4                 " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" =============== Syntatic ==========================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ================ Custom Settings ========================

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


" Ack Search
let g:ackhighlight = 1
nnoremap <Leader>f :Ack

" Emmet
let g:user_emmet_expandabbr_key = '<C-e>'          "Change trigger emmet key
let g:user_emmet_next_key = '<C-s>'                "Change trigger jump to next for emmet
" custom snippets
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

" GitGutter
let g:gitgutter_realtime = 0                       "Disable gitgutter in realtime
let g:gitgutter_eager = 0                          "Disable gitgutter to eager load on tab or buffer switch

" NERDTree
map <Leader>s :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git$', '\.sass-cache$', '_site$']
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Ctrp+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'c'

" Multiple Select default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Fugitive commands
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit<CR>

" Moving lines up and down
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" lazy fingers
command! -bang W w<bang>

" DOT command
vnoremap . :norm.<CR>

" window switching
map <C-J> <C-W>
map <C-K> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h

"so ~/.yadr/vim/settings.vim
"Press ENTER or type command to continue turned off
" set cmdheight=2
" redraw

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif
