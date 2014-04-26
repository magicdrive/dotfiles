"#---------------#
"# Basic Setting #
"#---------------#

set nocompatible

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap <Space>. :e ~/.vimrc<CR>
nnoremap <Space>e :e .<CR>

colorscheme default

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

syntax on

set hidden
set wrap

set scrolljump=15

set ttyfast

filetype plugin indent on
filetype plugin on

noremap  <C-@> <ESC>
noremap! <C-@> <ESC>
cnoremap <C-@> <C-c>

set statusline=%F%m%r%h%w\ 
            \[FORMAT=%{'['.(&fenc!=''?&fenc:'?').'::'.&ff.']'}]\ 
            \[TYPE=%Y]\ 
            \[ASCII=\%03.3b]\
            \[HEX=\%02.2B]\
            \[POS=%04l,%04v][%p%%]\
            \[LEN=%L]

highlight StatusLine ctermfg=White ctermbg=DarkBlue cterm=none
autocmd InsertLeave * :highlight StatusLine ctermfg=White ctermbg=DarkBlue
autocmd InsertEnter * :highlight StatusLine ctermfg=White ctermbg=DarkRed

if has('unix') && !has('gui_running')
    inoremap <silent> <ESC> <ESC>
    inoremap <silent> <C-[> <ESC>
endif

nnoremap <C-h> :help<Space>

set showmode
set title
set laststatus=2

:au BufEnter * execute ":lcd " . expand("%:p:h")

set number
set showmatch
set showcmd

"# ルーラーを表示
set ruler

set virtualedit=block

set backspace=indent,eol,start

set ambiwidth=double

set wildmenu
set wildmode=list,full

set history=256

command! NumberToggle :<SID>call ToggleNumber()

function! s:ToggleNumber()
    if &number == '1'
        echo "line number enable"
    else
        echo "line number disable"
    endif
    set number!
endfunction


set ignorecase
set smartcase

set hlsearch

nnoremap <ESC><ESC> :nohl<CR>
nnoremap <C-@><C-@> :nohl<CR>
nnoremap <C-c><C-c> :nohl<CR>

set incsearch

set whichwrap=b,s,[,],<,>

set autoindent
set smartindent
set smarttab
set cindent

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

inoremap {<CR> {<CR>}<LEFT><CR><UP><TAB>

set encoding=utf-8 
set fileencoding=utf-8 
set fileencodings=utf-8 

nnoremap <Space>w :<ESC>:new<CR>
nnoremap <Space>v :<ESC>:vnew<CR>

nnoremap <C-w><C-w> <C-w>_
nnoremap <C-w>w <C-w>_

nnoremap <C-\> <C-w>=

nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_

nnoremap <C-w><C-j> <C-w>j
nnoremap <C-w><C-k> <C-w>k
nnoremap <C-w><C-h> <C-w>h
nnoremap <C-w><C-l> <C-w>l

"__END__

