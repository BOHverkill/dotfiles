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

Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'lervag/vimtex'
Plug 'elzr/vim-json'
Plug 'ekalinin/Dockerfile.vim'

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

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
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
let g:vimtex_compiler_progname = 'nvr'

" neomake
call neomake#configure#automake('nrwi', 500)

" nvim settings
set pastetoggle=<F2>
set ignorecase
set smartcase
set mouse=a
set list

set spell
set spelllang=en,de

cmap W w
cmap X x
cmap Q q

set shiftwidth=2
set softtabstop=2
set expandtab
set noinsertmode


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
