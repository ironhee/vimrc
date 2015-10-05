"No compatibility to traditional vi
set nocompatible

"Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Plugin list ------------------------------------------------------------------

Plugin 'altercation/vim-colors-solarized'
Plugin 'Mustang2'
Plugin 'Railscasts-Theme-GUIand256color'
Plugin 'darktango.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'xoria256.vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/html5.vim'
Plugin 'lepture/vim-jinja'
if version < 704
  Plugin 'JulesWang/css.vim'
endif
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'cespare/vim-toml'
Plugin 'stephpy/vim-yaml'
Plugin 'cstrahan/vim-capnp'
Plugin 'dag/vim2hs'

Plugin 'scrooloose/syntastic'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rhysd/committia.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'matchit.zip'
Plugin 'taglist.vim'
Plugin 'fugitive.vim'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'

"End plugin list --------------------------------------------------------------
call vundle#end()
filetype plugin indent on

"Syntax highlighting.
syntax on

"Softtab -- use spaces instead tabs.
"Dictionary for auto complete
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words

"UI
colorscheme seoul256
hi Normal ctermbg=none
set cursorline
set nu
set incsearch
set hlsearch
set wildmenu
set showmatch
set lazyredraw

"Fold
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

"softtab -- use spaces instead tabs.
set expandtab
set tabstop=4 shiftwidth=4 sts=4
set autoindent nosmartindent

"set tab characters apart
set listchars=tab:↹\
set list

"I dislike CRLF.
if !exists("vimpager")
  set fileformat=unix
endif

set backspace=2

"Detect modeline hints.
set modeline

"Disable bell
set visualbell t_vb=

"Prefer UTF-8.
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp949,korea,iso-2022-kr

"Use mouse.
set mouse=a

"More tabs
set tabpagemax=25

filetype plugin on

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"File Syntax
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
    "CommentString
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s

    "These languages have their own tab/indent settings.
    au FileType cpp    setl ts=2 sw=2 sts=2
    au FileType javascript    setl ts=2 sw=2 sts=2
    au FileType ruby   setl ts=2 sw=2 sts=2
    au FileType yaml   setl ts=2 sw=2 sts=2
    au FileType html   setl ts=2 sw=2 sts=2
    au FileType jinja  setl ts=2 sw=2 sts=2
    au FileType lua    setl ts=2 sw=2 sts=2
    au FileType haml   setl ts=2 sw=2 sts=2
    au FileType sass   setl ts=2 sw=2 sts=2
    au FileType scss   setl ts=2 sw=2 sts=2
    au FileType make   setl ts=4 sw=4 sts=4 noet
    au FileType gitcommit setl spell

    "Some additional syntax highlighters.
    au! BufRead,BufNewFile *.wsgi setfiletype python
    au! BufRead,BufNewFile *.sass setfiletype sass
    au! BufRead,BufNewFile *.scss setfiletype scss
    au! BufRead,BufNewFile *.haml setfiletype haml
    au! BufRead,BufNewFile *.less setfiletype less
    au! BufRead,BufNewFile *.es6 setfiletype javascript
    au! BufRead,BufNewFile *.jsx setfiletype javascript
augroup END

"Markdown-related configurations.
augroup mkd
  autocmd BufRead *.markdown set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkdn     set formatoptions=tcroqn2 comments=n:> spell
  autocmd BufRead *.mkd      set formatoptions=tcroqn2 comments=n:> spell
augroup END

"English spelling checker.
setlocal spelllang=en_us

"Keep 80 columns.
set colorcolumn=80
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
"autocmd WinEnter * match OverLength /\%81v.\+/

"gVim-specific configurations (including MacVim).
if has("gui_running")
  "colorscheme solarized
  "set background=dark
  set guioptions=egmrLt
  set linespace=1
endif

"MacVim-specific configurations.
if has("gui_macvim") || has("gui_vimr")
  set imd
  set guifont=Hack:h16.00
endif

"GVim under GNOME
if has("gui_gnome")
  set guifont="Ubuntu Mono 11"
endif

"GVim under Windows
if has("gui_win32")
  set guifont=Consolas:h11:cANSI
endif

"Gundo -- Undo tree visualization
let g:gundo_right = 1
nnoremap <F5> :GundoToggle<CR>

"NERDTree
nnoremap <F4> :NERDTreeToggle<CR>

"Taglist
nnoremap <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 40

"Airline
set laststatus=2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    nnoremap <space> za
endif
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'


"CtrlP
let g:ctrlp_map = '<leader>p'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

"Tmux
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"Emmet
let g:user_emmet_expandabbr_key = '<c-e>'

"Syntastic
let g:syntastic_javascript_checkers = ['eslint']

"Keymap -----------------------------------------------------------------------
let mapleader=","
nnoremap  :tabn<CR>
" turn off search highlight
nnoremap <leader>/ :nohlsearch<CR>
" space open/closes folds
nnoremap <space> za
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>eb :tabe ~/.bash_profile<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session
nnoremap <leader>s :mksession<CR>
" bundle
nnoremap <leader>bi :BundleInstall<CR>
" open ag.vim
nnoremap <leader>a :Ag
" show register
nnoremap <leader>" :registers<CR>
" for hard training
" STEP1
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


"Commands ---------------------------------------------------------------------
command ES6 execute "%s/var \\(.*\\) = require(\\('.*'\\));/import \\1 from \\2;/g"

"Abbreviation -----------------------------------------------------------------
iab cnsl console.log();ODOD
iab jsfunc function () {}OD
