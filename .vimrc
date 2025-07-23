" ================================================ "
" vim-plug Plugin Manager
" ================================================ "

set nocompatible                    " We want the latest Vim settings/options
filetype off                        " Required for plugin loading

" Auto-install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin declarations
call plug#begin('~/.vim/plugged')

" File Management & Navigation
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-vinegar'
Plug 'ryanoasis/vim-devicons'

" Fuzzy Finding (FZF instead of CtrlP)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Search and Replace
Plug 'mileszs/ack.vim'
Plug 'skwp/greplace.vim'
Plug 'universal-ctags/ctags'

" UI & Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'

" Code Editing
Plug 'mg979/vim-visual-multi'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'

" PHP Development
Plug 'StanAngeloff/php.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'

" Autocompletion & Snippets
Plug 'ervandew/supertab'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language Support
Plug 'posva/vim-vue'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jelera/vim-javascript-syntax'

call plug#end()

" Enable filetype detection and plugins
filetype plugin indent on

" ================================================ "
" Visual Configuration
" ================================================ "

set t_Co=256
set background=dark
colorscheme hybrid
let g:hybrid_use_iTerm_colors = 1

" GUI Options
set guioptions-=e                   " No GUI tabs
set linespace=10                    " Line height for GUI
set lines=999                       " Maximize window height

" Remove scrollbars
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Visual enhancements
hi LineNr guibg=bg
hi foldcolumn guibg=bg
hi vertsplit guifg=bg guibg=bg

" ================================================ "
" General Configuration
" ================================================ "

set mouse=a                         " Enable mouse support
set title                           " Change terminal title
set number                          " Show line numbers
set backspace=indent,eol,start      " Allow backspace in insert mode
set history=1000                    " Command history
set showcmd                         " Show incomplete commands
set noerrorbells visualbell t_vb=   " No sounds
set autoread                        " Reload files changed outside vim
set smartcase                       " Smart case search
set cursorline                      " Highlight current line
set showmatch                       " Highlight matching brackets
set ignorecase                      " Case insensitive search
set hlsearch                        " Highlight search terms
set incsearch                       " Incremental search
set nowrap                          " Don't wrap lines
set linebreak                       " Wrap at word boundaries
set clipboard+=unnamed              " System clipboard integration
syntax on                           " Syntax highlighting
set laststatus=2                    " Always show status line
set fileencoding=UTF-8              " UTF-8 encoding
set fileformat=unix                 " Unix line endings
set encoding=UTF-8                  " UTF-8 encoding
set hidden                          " Allow hidden buffers
set splitbelow                      " Split below current window
set splitright                      " Split right of current window
set showtabline=2                   " Always show tab line
set autowrite                       " Auto-write when switching buffers
set complete=.,w,b,u                " Completion options

" ================================================ "
" Indentation
" ================================================ "

set autoindent                      " Auto-indent new lines
set smartindent                     " Smart indentation
set smarttab                        " Smart tab handling
set shiftwidth=4                    " Indent width
set softtabstop=4                   " Tab width in insert mode
set tabstop=4                       " Tab display width
set expandtab                       " Convert tabs to spaces

" ================================================ "
" Backup and Swap Files
" ================================================ "

set noswapfile                      " No swap files
set nobackup                        " No backup files
set nowb                            " No write backup

" Persistent undo
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

" ================================================ "
" Key Mappings
" ================================================ "

" Leader key
let mapleader="\<Space>"

" Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Disable Ex mode
noremap Q <NOP>

" Alternative escape
inoremap jk <ESC>

" Window navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Quick actions
nnoremap <Leader>d dd
nnoremap <c-x> dd
nnoremap <c-c> yy
nnoremap <Leader>y :let @* = expand("%")<CR>
nnoremap <Leader>j o<Esc>
nnoremap <Leader>k O<Esc>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Command shortcuts
command! -bang W w<bang>
command! -bang Q q<bang>

" Move lines up/down (Mac-specific Unicode characters)
nmap ∆ :m .+1<CR>
nmap ˚ :m .-2<CR>
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Copy visual selection to clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" Sort PHP use statements
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-"}'<cr>

" Indentation shortcuts
nnoremap <tab> >>
nnoremap <s-tab> <<

" ================================================ "
" FZF Configuration
" ================================================ "

" FZF key mappings
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>rg :Rg<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>h :History<CR>

" FZF layout
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = 'right:60%'

" ================================================ "
" NERDTree Configuration
" ================================================ "

nnoremap <Leader>s :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git$', '\.sass-cache$', '_site$', 'node_modules$', 'cache$']
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw = 0
let g:NERDTreeWinPos = "right"
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0

" Close vim if only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ================================================ "
" Airline Configuration
" ================================================ "

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" ================================================ "
" PHP Configuration
" ================================================ "

" PHP namespace insertion
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" PHP CS Fixer
let g:php_cs_fixer_level = 'psr2'
let g:php_cs_fixer_php_path = "php"
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0
nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

" PDV (PHP Documentor)
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
nnoremap <leader>pdv :call pdv#DocumentWithSnip()<CR>

" Laravel shortcuts
nnoremap <Leader><Leader>r :e app/Http/Requests<cr>
nnoremap <Leader><Leader>m :e app/<cr>
nnoremap <Leader><Leader>c :e app/Http/Controllers<cr>
nnoremap <Leader><Leader>o :e app/Observers<cr>
nnoremap <Leader><Leader>j :e app/Jobs<cr>
nnoremap <Leader><Leader>a :e resources/assets<cr>

" ================================================ "
" Other Plugin Configurations
" ================================================ "

" Ack search
let g:ackhighlight = 1
nnoremap <Leader>f :Ack

" Greplace
set grepprg=ack
let g:grep_cmd_opts = '--noheading'

" Emmet
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_next_key = '<C-s>'

" GitGutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Multiple cursors (vim-visual-multi - modern replacement)
" Ctrl+N to start multicursor and select words
" Tab/Shift+Tab to switch between Cursor and Extend mode
" q to skip current match, Q to remove current cursor
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-n>'
let g:VM_maps['Find Subword Under'] = '<C-n>'
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"] = '<C-k>'

" Fugitive
nnoremap <Leader>gs :Git status<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gd :Git diff<CR>
nnoremap <Leader>gc :Git commit<CR>

" Vue
let g:vue_disable_pre_processors=1

" ================================================ "
" Auto-commands
" ================================================ "

" Auto-source vimrc on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

" ================================================ "
" Completion and Wildmenu
" ================================================ "

set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~
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

" ================================================ "
" Folding
" ================================================ "

set foldmethod=indent
set foldnestmax=3
set nofoldenable

" ================================================ "
" Scrolling
" ================================================ "

set scrolloff=4
set sidescrolloff=15
set sidescroll=1

" ================================================ "
" Visual Elements
" ================================================ "

" Show tabs and trailing spaces (simplified to avoid encoding issues)
set list listchars=tab:>-,trail:.

" ================================================ "
" NOTES AND TIPS
" ================================================ "

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

" ================================================ "
" Cursor movement
" ================================================ "

" h        # move cursor left
" j        # move cursor down
" k        # move cursor up
" l        # move cursor right
" H        # move to top of screen
" M        # move to middle of screen
" L        # move to bottom of screen
" w        # jump forwards to the start of a word
" W        # jump forwards to the start of a word (words can contain punctuation)
" e        # jump forwards to the end of a word
" E        # jump forwards to the end of a word (words can contain punctuation)
" b        # jump backwards to the start of a word
" B        # jump backwards to the start of a word (words can contain punctuation)
" 0        # jump to the start of the line
" ^        # jump to the first non-blank character of the line
" $        # jump to the end of the line
" g_       # jump to the last non-blank character of the line
" gg       # go to the first line of the document
" G        # go to the last line of the document
" 5G       # go to line 5
" fx       # jump to next occurrence of character x
" tx       # jump to before next occurrence of character x
" }        # jump to next paragraph (or function/block, when editing code)
" {        # jump to previous paragraph (or function/block, when editing code)
" zz       # center cursor on screen
" Ctrl + b # move back one full screen
" Ctrl + f # move forward one full screen
" Ctrl + d # move forward 1/2 a screen
" Ctrl + u # move back 1/2 a screen

" ================================================ "
" Insert mode - inserting/appending text
" ================================================ "

" i        # insert before the cursor
" I        # insert at the beginning of the line
" a        # insert (append) after the cursor
" A        # insert (append) at the end of the line
" o        # append (open) a new line below the current line
" O        # append (open) a new line above the current line
" ea       # insert (append) at the end of the word
" Esc      # exit insert mode

" ================================================ "
" Editing
" ================================================ "

" r        # replace a single character
" J        # join line below to the current one
" cc       # change (replace) entire line
" cw       # change (replace) to the start of the next word
" ce       # change (replace) to the end of the next word
" cb       # change (replace) to the start of the previous word
" c$       # change (replace) to the end of the line
" s        # delete character and substitute text
" S        # delete line and substitute text (same as cc)
" xp       # transpose two letters (delete and paste)
" .        # repeat last command
" u        # undo
" Ctrl + r # redo

" ================================================ "
" Marking text (visual mode)
" ================================================ "

" v        # start visual mode, mark lines, then do a command (like y-yank)
" V        # start linewise visual mode
" o        # move to other end of marked area
" O        # move to other corner of block
" aw       # mark a word
" ab       # a block with ()
" aB       # a block with {}
" ib       # inner block with ()
" iB       # inner block with {}
" Esc      # exit visual mode
" Ctrl + v # start visual block mode

" ================================================ "
" Visual commands
" ================================================ "

" >       # shift text right
" <       # shift text left
" y       # yank (copy) marked text
" d       # delete marked text
" ~       # switch case

" ================================================ "
" Cut and paste
" ================================================ "

" yy       # yank (copy) a line
" 2yy      # yank (copy) 2 lines
" yw       # yank (copy) the characters of the word from the cursor position to the start of the next word
" y$       # yank (copy) to end of line
" p        # put (paste) the clipboard after cursor
" P        # put (paste) before cursor
" dd       # delete (cut) a line
" 2dd      # delete (cut) 2 lines
" dw       # delete (cut) the characters of the word from the cursor position to the start of the next word
" D        # delete (cut) to the end of the line
" d$       # delete (cut) to the end of the line
" d^       # delete (cut) to the first non-blank character of the line
" d0       # delete (cut) to the begining of the line
" x        # delete (cut) character

" ================================================ "
" Search and replace
" ================================================ "

" /pattern       # search for pattern
" ?pattern       # search backward for pattern
" \vpattern      # 'very magic' pattern: non-alphanumeric characters are interpreted as special regex symbols (no escaping needed)
" n              # repeat search in same direction
" N              # repeat search in opposite direction
" :%s/old/new/g  # replace all old with new throughout file
" :%s/old/new/gc # replace all old with new throughout file with confirmations
" :noh           # remove highlighting of search matches

" ================================================ "
" Search in multiple files
" ================================================ "

" :vimgrep /pattern/ {file} # search for pattern in multiple files
" :cn                       # jump to the next match
" :cp                       # jump to the previous match
" :copen                    # open a window containing the list of matches

" ================================================ "
" Exiting
" ================================================ "

" :w              # write (save) the file, but don't exit
" :w !sudo tee %  # write out the current file using sudo
" :wq or :x or ZZ # write (save) and quit
" :q              # quit (fails if there are unsaved changes)
" :q! or ZQ       # quit and throw away unsaved changes

" ================================================ "
" Working with multiple files
" ================================================ "

" :e file       # edit a file in a new buffer
" :bnext or :bn # go to the next buffer
" :bprev or :bp # go to the previous buffer
" :bd           # delete a buffer (close a file)
" :ls           # list all open buffers
" :sp file      # open a file in a new buffer and split window
" :vsp file     # open a file in a new buffer and vertically split window
" Ctrl + ws     # split window
" Ctrl + ww     # switch windows
" Ctrl + wq     # quit a window
" Ctrl + wv     # split window vertically
" Ctrl + wh     # move cursor to the left window (vertical split)
" Ctrl + wl     # move cursor to the right window (vertical split)
" Ctrl + wj     # move cursor to the window below (horizontal split)
" Ctrl + wk     # move cursor to the window above (horizontal split)

" ================================================ "
" Tabs
" ================================================ "

" :tabnew or :tabnew file # open a file in a new tab
" Ctrl + wT               # move the current split window into its own tab
" gt or :tabnext or :tabn # move to the next tab
" gT or :tabprev or :tabp # move to the previous tab
" <number>gt              # move to tab <number>
" :tabmove <number>       # move current tab to the <number>th position (indexed from 0)
" :tabclose or :tabc      # close the current tab and all its windows
" :tabonly or :tabo       # close all tabs except for the current one
" :tabdo command          # run the command on all tabs (e.g. :tabdo q - closes all opened tabs
