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
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/vim-easy-align'
Plugin 'ryanoasis/vim-devicons'
Plugin 'noahfrederick/vim-composer'
Plugin 'noahfrederick/vim-laravel'

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
Plugin 'posva/vim-vue'
Plugin 'rafi/awesome-vim-colorschemes'

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
"Plugin 'SirVer/ultisnips'

" Git and command line "
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Syntax highlight "
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'

" Color schemes "
"Plugin 'kristijanhusak/vim-hybrid-material'

" All of your Plugins must be added before the following line "
call vundle#end()            " required
filetype plugin indent on





" ================================================ "
" Visual
" ================================================ "

set t_Co=256
set background=dark
colorscheme hybrid
let g:hybrid_use_iTerm_colors = 1

"set macligatures                           "We want pretty symbols, when available.
set guioptions-=e                           "We don't want Gui tabs.
set linespace=10                            "Macvim-specific line-height.
set lines=999
"set guifont=DroidSansMono\ Nerd\ Font\ 1

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
set fileencoding=UTF-8               "Set utf-8 encoding on write
set fileformat=unix                 "End of line characters
set fileformats+=dos                "Disable new line at end of file
set encoding=UTF-8                   "Set utf-8 encoding on read
set hidden                          "Switch buffers when they are not saved"
set splitbelow                      "Create file underneath current
set splitright                      "Create file on the right side
set showtabline=2                   "Always show tabs
set autowrite                       "Automatically write the file when switching buffers
set complete=.,w,b,u                "Set our desired autocomplition matching
"set shell=/usr/bin/zsh





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





" ================================================ "
" Swap files 
" ================================================ "
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


" Automatically source vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
    " Comment out the airline refresh or make it conditional
    " autocmd BufWritePost .vimrc :AirlineRefresh
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
"nnoremap <Leader>lr :e app/Http/routes.php<cr>
"nnoremap <Leader>lm :!php artisan make:
nnoremap <Leader><Leader>r :e app/Http/Requests<cr>
nnoremap <Leader><Leader>m :e app/<cr>
nnoremap <Leader><Leader>c :e app/Http/Controllers<cr>
nnoremap <Leader><Leader>o :e app/Observers<cr>
nnoremap <Leader><Leader>j :e app/Jobs<cr>
nnoremap <Leader><Leader>a :e resources/assets<cr>

" Sort PHP use statements
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-"}'<cr>





" ================================================ "
" Functions
" ================================================ "
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





" ================================================ "
" Persistent Undo
" ================================================ "

" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·





" ================================================ "
" Folds
" ================================================ "

set foldmethod=indent           " fold based on indent
set foldnestmax=3               " deepest fold is 3 levels
set nofoldenable                " don't fold by default

nnoremap <tab> >>
nnoremap <s-tab> <<





" ================================================ ""
" Completion
" ================================================ "

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






" ================================================ "
" Scrolling
" ================================================ "

set scrolloff=4                 " Start scrolling when we're 4 lines away from margins
set sidescrolloff=15
set sidescroll=1





" ================================================ "
" Airline
" ================================================ "

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline_theme="hybrid"





" ================================================ "
" UltiSnips
" ================================================ "

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"






" ================================================ "
" PDV
" ================================================ "

let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <leader>pdv :call pdv#DocumentWithSnip()<CR>





" ================================================ "
" vim-php-cs-fixer
" ================================================ "

let g:php_cs_fixer_level = 'psr2'
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0   

nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>





" ================================================ "
" Ack Search
" ================================================ "
let g:ackhighlight = 1
nnoremap <Leader>f :Ack






" ================================================ "
" Greplace
" ================================================ "
set grepprg=ack                                     "We want to use ack for the search
let g:grep_cmd_opts = '--noheading'






" ================================================ "
" Emmet
" ================================================ "
let g:user_emmet_expandabbr_key = '<C-e>'           "Change trigger emmet key
let g:user_emmet_next_key = '<C-s>'                 "Change trigger jump to next for emmet
" custom snippets
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))





" ================================================ "
" GitGutter
" ================================================ "
let g:gitgutter_realtime = 0                       "Disable gitgutter in realtime
let g:gitgutter_eager = 0                          "Disable gitgutter to eager load on tab or buffer switch





" ================================================ "
" NERDTree
" ================================================ "
nnoremap <Leader>s :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git$', '\.sass-cache$', '_site$', 'node_modules$', 'cache$']
"let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw = 0
let g:NERDTreeWinPos = "right"


let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeFileExtensionHighlightFullName = 0
let g:NERDTreeExactMatchHighlightFullName = 0
let g:NERDTreePatternMatchHighlightFullName =  0

"- close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif





" ================================================ "
" VIM EASY ALIGN
" ================================================ "

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)





" ================================================ "
" Ctrp+P
" ================================================ "
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|DS_Store)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

nmap <C-p>  :CtrlP<cr>
"nmap <C-r>  :CtrlPBufTag<cr>
nmap <C-e>  :CtrlPMRUFiles<cr>





" ================================================ "
" Vim-Vue 
" ================================================ "
let g:vue_disable_pre_processors=1





" ================================================ "
" Multiple Select 
" ================================================ "

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





" ================================================ "
" Fugitive commands
" ================================================ "
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
" Esc      # exit insert mod





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
"Visual commands
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





