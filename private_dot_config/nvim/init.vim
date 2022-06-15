set rtp^=/usr/share/vim/vimfiles/
let g:python3_host_prog='/usr/bin/python3'
let g:powerline_pycmd="py3"
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete-clangx'
Plug 'neomake/neomake'
Plug 'ludovicchabant/vim-gutentags'

Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'lervag/vimtex'
Plug 'elzr/vim-json'
Plug 'ekalinin/Dockerfile.vim'
" Plug 'lifepillar/pgsql.vim'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'sjl/badwolf'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
" Plug 'Townk/vim-autoclose' " Disabled because escape is bugged

Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'gikmx/ctrlp-obsession'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/DoxygenToolkit.vim' " :Dox

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Break the habit
" Plug 'takac/vim-hardtime'

Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'

" Initialize plugin system
call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" airline
set laststatus=2
set showtabline=2
set encoding=utf-8
set t_Co=256
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 1 

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'

" neomake
call neomake#configure#automake('nrwi', 500)

" iamcco/markdown-preview.nvim
let g:mkdp_auto_start = 1
" session
let g:prosession_dir = '~/.local/share/nvim/session/'

" Hardmode
let g:hardtime_default_on = 1
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>", "<PageUp>", "<PageDown>"]

" Easymotion
" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" shfmt
" Auto format on save
" let g:shfmt_fmt_on_save = 1

" gutentags
set statusline+=%{gutentags#statusline()}
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_project_root = ['Makefile']
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']

" nvim settings
set pastetoggle=<F2>
set ignorecase
set smartcase
set mouse=a
set list

set number
set relativenumber
set cursorline

set spell
set spelllang=en,de

cmap W w
cmap X x
cmap Q q

set shiftwidth=2
set softtabstop=2
set expandtab
set noinsertmode

set listchars=tab:»\ ,trail:-,nbsp:+

" Misc
" Allow saving files when I stupidly forgot to start vim with sudo
cmap w!! w !sudo tee > /dev/null %

" Terminal
tnoremap <Esc> <C-\><C-n>

" Clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
set clipboard+=unnamedplus
set go+=a


fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()


fun! TrimEmpyLines()
    let l:save = winsaveview()
    %g/^\s*$/d
    call winrestview(l:save)
endfun
command! TrimEmpyLines call TrimEmpyLines()

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif


" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    set undodir=~/.local/share/nvim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
  endif

" color
colorscheme badwolf
