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
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
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
" Note: Install ctags via homebrew: brew install universal-ctags

" UI & Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Modern Color Schemes
Plug 'projekt0n/github-nvim-theme'              " GitHub Dark/Light themes
Plug 'folke/tokyonight.nvim'                    " Tokyo Night (JetBrains-like)
Plug 'navarasu/onedark.nvim'                    " Atom's One Dark (JetBrains-like)
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }  " Catppuccin (modern & popular)
Plug 'rafi/awesome-vim-colorschemes'            " Collection of themes (fallback)

" Code Editing
Plug 'mg979/vim-visual-multi'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'] }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'

" PHP Development (uncomment if needed)
" Plug 'StanAngeloff/php.vim', { 'for': 'php' }
" Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }
" Plug 'tobyS/vmustache', { 'for': 'php' }
" Plug 'tobyS/pdv', { 'for': 'php' }
" Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
" Plug 'noahfrederick/vim-composer', { 'for': 'php' }
" Plug 'noahfrederick/vim-laravel', { 'for': 'php' }

" Autocompletion & LSP (coc.nvim replaces SuperTab and SnipMate)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Note: Run :CocInstall coc-tsserver coc-eslint coc-prettier coc-json coc-yaml coc-docker after install

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language Support - TypeScript & JavaScript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'typescriptreact'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'javascriptreact'] }

" Docker & DevOps
Plug 'ekalinin/Dockerfile.vim'
Plug 'hashivim/vim-terraform'

" YAML & JSON
Plug 'stephpy/vim-yaml'
Plug 'elzr/vim-json', { 'for': 'json' }

" Additional Language Support
Plug 'leafOfTree/vim-vue-plugin', { 'for': 'vue' }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }

call plug#end()

" Enable filetype detection and plugins
filetype plugin indent on

" ================================================ "
" Visual Configuration
" ================================================ "

set t_Co=256
set background=dark
set termguicolors                   " Enable true color support

" Color Scheme Configuration
" The Neovim themes (github-nvim-theme, tokyonight, onedark, catppuccin) require Lua
" If using Vim (not Neovim), use gruvbox instead
" If using Neovim, uncomment your preferred theme below

" For Vim (no Lua support) - use gruvbox
colorscheme gruvbox               " Gruvbox (classic, works in Vim)

" For Neovim only (requires Lua) - uncomment one of these if using nvim:
" colorscheme github_dark_default     " GitHub Dark
" colorscheme tokyonight-night        " Tokyo Night (JetBrains-like)
" colorscheme onedark                 " One Dark (JetBrains-like)
" colorscheme catppuccin-mocha        " Catppuccin Mocha (modern)

" GitHub theme specific settings (only for Neovim)
" let g:github_theme_style = 'dark_default'

" Airline theme (matches colorscheme)
let g:airline_theme = 'gruvbox'

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
set clipboard=unnamed,unnamedplus   " System clipboard integration (macOS)
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
set lazyredraw                      " Don't redraw during macros (performance)
set regexpengine=1                  " Use old regex engine (sometimes faster)
set updatetime=300                  " Faster completion and diagnostics
set timeoutlen=500                  " Faster key sequence timeout

" ================================================ "
" Indentation
" ================================================ "

set autoindent                      " Auto-indent new lines
set smartindent                     " Smart indentation
set smarttab                        " Smart tab handling
set shiftwidth=2                    " Indent width (2 spaces for JS/TS)
set softtabstop=2                   " Tab width in insert mode
set tabstop=2                       " Tab display width
set expandtab                       " Convert tabs to spaces

" File-specific indentation
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType go setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab

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
nnoremap <Leader>bt :BTags<CR>
nnoremap <Leader>o :CocList outline<CR>
nnoremap <Leader>h :History<CR>

" FZF layout
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = 'right:60%'

" ================================================ "
" NERDTree Configuration
" ================================================ "

nnoremap <Leader>s :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.git$', 'node_modules$', 'dist$', 'build$', '\.next$', 'coverage$', '\.cache$']
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw = 0
let g:NERDTreeWinPos = "right"
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0

" Close vim if only NERDTree is left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
" TypeScript/JavaScript Configuration
" ================================================ "

" Set TypeScript filetype for .tsx files
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Auto-format on save with Prettier (via coc-prettier)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ESLint auto-fix
nnoremap <silent><leader>ef :CocCommand eslint.executeAutofix<CR>

" NestJS shortcuts
nnoremap <Leader><Leader>c :e src/controllers<cr>
nnoremap <Leader><Leader>s :e src/services<cr>
nnoremap <Leader><Leader>m :e src/modules<cr>
nnoremap <Leader><Leader>e :e src/entities<cr>
nnoremap <Leader><Leader>d :e src/dto<cr>

" ================================================ "
" PHP Configuration (commented out - uncomment if needed)
" ================================================ "

" " PHP namespace insertion
" function! IPhpInsertUse()
"     call PhpInsertUse()
"     call feedkeys('a',  'n')
" endfunction
" autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
" autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

" " PHP CS Fixer
" let g:php_cs_fixer_level = 'psr12'
" let g:php_cs_fixer_php_path = "php"
" let g:php_cs_fixer_enable_default_mapping = 1
" let g:php_cs_fixer_dry_run = 0
" let g:php_cs_fixer_verbose = 0
" nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

" " PDV (PHP Documentor)
" let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
" nnoremap <leader>pdv :call pdv#DocumentWithSnip()<CR>

" " Laravel shortcuts
" nnoremap <Leader><Leader>r :e app/Http/Requests<cr>
" nnoremap <Leader><Leader>m :e app/<cr>
" nnoremap <Leader><Leader>c :e app/Http/Controllers<cr>
" nnoremap <Leader><Leader>o :e app/Observers<cr>
" nnoremap <Leader><Leader>j :e app/Jobs<cr>
" nnoremap <Leader><Leader>a :e resources/assets<cr>

" ================================================ "
" Coc.nvim (LSP) Configuration
" ================================================ "

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Apply codeAction to the selected region
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Show all diagnostics
nnoremap <silent><nowait> <space>cd  :<C-u>CocList diagnostics<cr>

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
let g:user_emmet_settings = {
\  'typescript': {
\    'extends': 'jsx',
\  },
\  'typescriptreact': {
\    'extends': 'jsx',
\  },
\  'javascript': {
\    'extends': 'jsx',
\  },
\  'javascriptreact': {
\    'extends': 'jsx',
\  },
\}

" GitGutter
let g:gitgutter_async = 1

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

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

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
set wildignore+=*/node_modules/**
set wildignore+=*/dist/**
set wildignore+=*/build/**
set wildignore+=*/.next/**
set wildignore+=*/coverage/**
set wildignore+=*.log
set wildignore+=*/vendor/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=package-lock.json
set wildignore+=yarn.lock

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
