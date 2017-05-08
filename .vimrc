" ================================================ "
" Vundle
" ================================================ "

set nocompatible                    "We want the latest Vim setting/options "
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Gui plugins "
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/vim-easy-align'

" Search and movement "
Plugin 'mileszs/ack.vim'
Plugin 'skwp/greplace.vim'
Plugin 'universal-ctags/ctags'

" Code edit "
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'

" PHP "
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'stephpy/vim-php-cs-fixer'

" Autocomplete and sinppets "
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'

" Git and command line "
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Syntax highlight "
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'

" Color schemes "
Plugin 'kristijanhusak/vim-hybrid-material'

" All of your Plugins must be added before the following line "
call vundle#end()            " required
filetype plugin indent on





" ================================================ "
" Visual
" ================================================ "

set t_Co=256
set background=dark
colorscheme hybrid_reverse
let g:hybrid_use_iTerm_colors = 1

"set macligatures                           "We want pretty symbols, when available.
set guioptions-=e                           "We don't want Gui tabs.
set linespace=10                            "Macvim-specific line-height.
set lines=999
set guifont=Knack\ Regular\ Nerd\ Font\ Complete\:h13

set guioptions-=l                           "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We'll fake a custom left padding for each window.
hi LineNr guibg=bg
"set foldcolumn=2
hi foldcolumn guibg=bg
""Get rid of ugly split borders.
hi vertsplit guifg=bg guibg=bg

" airline
let g:airline_theme='base16_monokai'





" ================================================ "
" General Congif
" ================================================ "

set mouse=a                         "Enable mouse
set title                           "Change the terminal's title
set number                          "Line numbers are good
set backspace=indent,eol,start      "Allow backspace in insert mode
set history=1000                    "Store lots of :cmdline history
set showcmd                         "Show incomplete cmds down the bottom
set noerrorbells visualbell t_vb=   "No sounds
set autoread                        "Reload files changed outside vim
set smartcase                       "Smart case search if there is uppercase
set cursorline                      "Highlight current line
set showmatch                       "Highlight matching bracket
set ignorecase                      "No case sensitivity
set hlsearch                        "Highlight search term
set incsearch                       "Jump to found term while searching
set showmatch                       "Highlight matching bracket
set nowrap                          "Don't wrap lines
set linebreak                       "Wrap lines at convenient points
"set shortmess=atI                   "Don’t show the intro message when starting Vim
set clipboard+=unnamed              "Copy to system clibpoard"
set go+=a                           "Visual selection automatically copied to the clipboard
syntax on                           "Turn on syntax highlighting
set laststatus=2                    "Show statusbar
set fileencoding=utf8               "Set utf-8 encoding on write
"set fileformats+=dos                "Disable new line at end of file
set encoding=utf8                   "Set utf-8 encoding on read
set hidden                          "Switch buffers when they are not saved"
set splitbelow                      "Create file underneath current
set splitright                      "Create file on the right side
set showtabline=2                   "Always show tabs
set autowrite                       "Automatically write the file when switching buffers
set complete=.,w,b,u                "Set our desired autocomplition matching
set shell=sh





" ================================================ "
" Indentation
" ================================================ "

set autoindent                      "Indent at the same level of the previous line"
set smartindent
set smarttab
set shiftwidth=4                    "Tab width in normal mode
set softtabstop=4                   "Tab width in insert mode
set tabstop=4
set expandtab





" ================================================
" Swap files
" ================================================
set noswapfile
set nobackup
set nowb





" ================================================ "
" Key mappings (bindings)
" ================================================ "

" Map space key as leader
let mapleader="\<Space>"

" Make it easy to edit vimrc file
"nnoremap <Leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Disable Ex mode
noremap Q <NOP>

" Overwrite ESC
inoremap jk <ESC>
" inoremap <esc> <nop>

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" delete line
nnoremap <Leader>d dd

" behave like other editors
nnoremap <c-x> dd
nnoremap <c-c> yy

" Copy file path
nnoremap <Leader>y :let @* = expand("%")<CR>

" Add empty line and stay in command mode
nnoremap <Leader>j o<Esc>
nnoremap <Leader>k O<Esc>

" Fast save
nnoremap <Leader>w :w<CR>

" Fast quit
nnoremap <Leader>q :q<CR>

" lazy fingers - save even if I typed uppercase W
command! -bang W w<bang>

" lazy fingers - quit even if I typed uppercase Q
command! -bang Q q<bang>

" nnoremap <Left> h
" nnoremap <Right> l
" nnoremap <Up> k
" nnoremap <Down> j
" inoremap <up> k
" inoremap <down> j
" inoremap <left> h
" inoremap <right> l

" Moving line/s up and down
nmap ∆ :m .+1<CR>
nmap ˚ :m .-2<CR>
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

"
" Automatically source vimrc file on save
augroup autosourcing

    autocmd!
    autocmd BufWritePost .vimrc source %
    autocmd BufWritePost .vimrc :AirlineRefresh

augroup END

" php function
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" Copy visual selection to clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR


" Laravel specific
nnoremap <Leader><Leader>r :e routes<cr>
"nnoremap <Leader>lr :e app/Http/routes.php<cr>
nnoremap <Leader>lm :!php artisan make:
nnoremap <Leader><Leader>c :e app/Http/Controllers<cr>
nnoremap <Leader><Leader>m :e app/<cr>
nnoremap <Leader><Leader>o :e app/Observers<cr>
nnoremap <Leader><Leader>j :e app/Jobs<cr>
nnoremap <Leader><Leader>v :e resources/views<cr>
nnoremap <Leader><Leader>a :e resources/assets<cr>

" Sort PHP use statements
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-"}'<cr>





" ================================================
" Functions
" ================================================
function! FixFile()
    let l = line(".")
    let c = col(".")
    " Delete trailing slashes
    %s/\s\+$//e
    " Replace tabs with spaces
    %s/\t/    /e
    " Fix indentation
    exec "normal! gg=G"
    call cursor(l, c)
endfunction

function! SetFileType()
    let name = input("Filetype: ")
    if (name != "")
        exec "set filetype=" . name
    endif
endfunction

function! NERDTreeToggleInCurDir()
    " If NERDTree is open in the current buffer
    if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        exe ":NERDTreeClose"
    else
        if (expand("%:t") != '')
            exe ":NERDTreeFind"
        else
            exe ":NERDTreeToggle"
        endif
    endif
endfunction





" ================================================
" Persistent Undo
" ================================================

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·




" ================================================
" Folds
" ================================================

set foldmethod=indent           " fold based on indent
set foldnestmax=3               " deepest fold is 3 levels
set nofoldenable                " don't fold by default

nnoremap <tab> >>
nnoremap <s-tab> <<


" ================================================
" Completion
" ================================================

set wildmode=list:longest
set wildmenu                    " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif





" ================================================
" Scrolling
" ================================================

set scrolloff=4                 " Start scrolling when we're 4 lines away from margins
set sidescrolloff=15
set sidescroll=1





" ================================================
" Plugins Settings
" ================================================

"/
"/ Airline
"/
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline_theme="molokai"
let g:airline#extensions#tabline#enabled = 1 		"enable the tabline
let g:airline#extensions#tabline#fnamemod = ':t' 	" show just the filename of buffers in the tab line
let g:airline_detect_modified=1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"/
"/ UltiSnips
"/
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"/
"/ PDV
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>pdv :call pdv#DocumentWithSnip()<CR>

"/
"/ vim-php-cs-fixer
"/

let g:php_cs_fixer_level = 'psr2'
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ Ack Search
"/
let g:ackhighlight = 1
nnoremap <Leader>f :Ack

"/
"/ Greplace
"/
set grepprg=ack                                     "We want to use ack for the search
let g:grep_cmd_opts = '--noheading'

"/
"/ Emmet
"/
let g:user_emmet_expandabbr_key = '<C-e>'           "Change trigger emmet key
let g:user_emmet_next_key = '<C-s>'                 "Change trigger jump to next for emmet
" custom snippets
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

"/
"/ GitGutter
"/
let g:gitgutter_realtime = 0                       "Disable gitgutter in realtime
let g:gitgutter_eager = 0                          "Disable gitgutter to eager load on tab or buffer switch

"/
"/ NERDTree
"/
nnoremap <Leader>s :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git$', '\.sass-cache$', '_site$', 'node_modules$', 'cache$']
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw = 0

"- close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"/
"/ VIM EASY ALIGN
"/

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"/
"/ Ctrp+P
"/
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|DS_Store)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

nmap <C-p>  :CtrlP<cr>
"nmap <C-r>  :CtrlPBufTag<cr>
nmap <C-e>  :CtrlPMRUFiles<cr>

"/
"/ Multiple Select 
"/

" Multiple Select default mapping

let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_start_word_key='g<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Called once right before you start selecting multiple cursors

" Called once only when the multiple selection is canceled (default <Esc>)
"function! Multiple_cursors_before()
"  if exists(':NeoCompleteLock')==2
"    exe 'NeoCompleteLock'
"  endif
"endfunction

"function! Multiple_cursors_after()
"  if exists(':NeoCompleteUnlock')==2
"    exe 'NeoCompleteUnlock'
"  endif
"endfunction

"/
"/ Fugitive commands
"/
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>

" DOT command
"vnoremap . :norm.<CR>

"so ~/.yadr/vim/settings.vim
"Press ENTER or type command to continue turned off
" set cmdheight=2
" redraw

" Put at the very end of your .vimrc file.
"function! PhpSyntaxOverride()
"    hi! def link phpDogcTags  phpDefine
"    hi! def link phpDocParam phpType
"endfunction

"augroup phpSyntaxOverride
"    autocmd!
"    autocmd FileType php call PhpSyntaxOverride()
"augroup END

" Notes and Tips
" - press 'zz' to instantly center the line where the cursor is located
" 'za' open folded code
" 'zc' fold code
" - ctags <C-]> to go to function and <C-^> to go back
" - <C-w> + > to enlarge
" - <C-w> + < to shrink
" - <C-|> to enlarge the right window
" merge bottom line with top line by typing capital 'J'

" mark a plase with 'm + any key' and then to back to it type '+that key
" lowercase keys will works for the current buffer only, capital letters will work across all buffers
" `+ mark letter will take you back to the specific cursor position
" - to check marks type :marks

":e filename - Edit a file in a new buffer
":bnext (or :bn) - go to next buffer
":bprev (of :bp) - go to previous buffer
":bd - delete a buffer (close a file)
":sp filename - Open a file in a new buffer and split window
"ctrl+ws - Split windows
"ctrl+ww - switch between windows
"ctrl+wq - Quit a window
"ctrl+wv - Split windows vertically
