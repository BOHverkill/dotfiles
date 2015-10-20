" BOHverkill's Vimrc
source /etc/vimrc

" Plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'rodjek/vim-puppet'
" Plugin 'tfnico/vim-gradle'
" Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'tomasr/molokai'
Plugin 'tpope/vim-surround'
Plugin 'rstacruz/vim-closer'
Plugin 'suan/vim-instant-markdown'
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'sjl/badwolf'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Misc
"Allow saving files when I stupidly forgot to start vim with sudo
cmap w!! w !sudo tee > /dev/null %

" vim-arilne
set laststatus=2
set showtabline=2
set encoding=utf-8
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" NERDTree
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

set pastetoggle=<F2>

cmap W w
cmap X x
cmap Q q

"color
"colorscheme github
"colorscheme molokai
colorscheme badwolf

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

