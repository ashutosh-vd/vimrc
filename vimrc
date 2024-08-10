"General editor settings
set tabstop=4
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set incsearch
set shellslash
set number
set relativenumber
set cino+=L0 
syntax on
filetype indent on
filetype off
setlocal indentkeys-=:


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
 
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-dispatch'
Plugin 'errormarker.vim'

Plugin 'jiangmiao/auto-pairs'


" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


let g:gruvbox_contrast_light='medium'
"let g:gruvbox_contrast_dark='soft'
let g:gruvbox_number_column='fg0'
let g:gruvbox_color_column='bg0'
autocmd vimenter * ++nested colorscheme gruvbox
set background=light
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
 endif
endif


"Theme (requires Solarized Light terminal theme to work properly)
"let g:solarized_termcolors=256
"set background=light
"colorscheme solarized


"keybindings for { completion, "jk" for escape, ctrl-a to select all
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
imap jk         <Esc>
map <C-a> <esc>ggVG<CR>
set belloff=all

"Compile and run
"Note that the next uncommented line requires the build.sh script!
"Replace it with the commented line below if you don't have it
set makeprg=g++\ -static\ -DDEBUG\ -lm\ -s\ -x\ c++\ -Wall\ -Wextra\ -O2\ -std=c++17\ -o\ %:r\ %
"set makeprg=build.sh\ %:r
autocmd filetype cpp nnoremap <F9> :w <bar> Make <CR>
"autocmd filetype cpp nnoremap <F9> :w <bar> !build.sh %:r <CR>
autocmd filetype cpp nnoremap <F7> :vertical terminal ++shell ++cols=44 ./%:r<CR>
autocmd filetype cpp nnoremap <F8> :!time ./%:r<CR>



"Append template to new C++ files
autocmd BufNewFile *.cpp 0r /home/vasu/vimcp/Library/Template.cpp



execute pathogen#infect()

"Clipboard configuration
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
        augroup WSLYank
                    autocmd!
                            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
                                augroup END
                            endif

        au BufNewFile,BufRead *.tex
            \ set nocursorline |
            \ set nornu |
            \ set number |
            \ let g:loaded_matchparen=1 |


 
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif
 
