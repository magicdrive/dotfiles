"#---------------#
"# Basic Setting #
"#---------------#

set nocompatible

" insert mode cursor
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>

inoremap <C-f> <Right>
inoremap <C-b> <Left>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap <Space>. :e ~/.vimrc<CR>
nnoremap <Space>e :e .<CR>

" highlight Full width space
function! FullWidthSpace()
    highlight FullWidthSpace
                \ cterm=underline
                \ ctermfg=darkgrey
                \ gui=underline
                \ guifg=darkgrey
endfunction

if has('syntax')
    augroup FullWidthSpace
        autocmd!
        autocmd ColorScheme * call FullWidthSpace()
        autocmd VimEnter,WinEnter * match FullWidthSpace /　/
    augroup END
    call FullWidthSpace()
endif

let g:matsubi_space_state = 1
function! EndSpace()
    if g:matsubi_space_state
        highlight EndSpace ctermbg=199 guibg=Cyan
    else
        highlight EndSpace ctermbg=NONE guibg=NONE
    endif
endfunction

function! s:ToggleEndSpaceHighLight()
    let g:matsubi_space_state=g:matsubi_space_state ? 0 : 1
    call EndSpace()
endfunction
nnoremap <Plug>(mykeylite)c :call <SID>ToggleEndSpaceHighLight()<CR>

if has('syntax')
    augroup EndSpace
        autocmd!
        autocmd ColorScheme * call EndSpace()
        autocmd VimEnter,WinEnter * match EndSpace /\s\+$/
    augroup END
    call FullWidthSpace()
endif
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

"### complation
set complete+=k
set completeopt=menuone
set infercase

"# keybind
inoremap <C-j> <C-x><C-n>
inoremap <C-k> <C-x><C-o>
inoremap <C-l> <C-x><C-k>
inoremap <C-_> <C-x><C-f>

for key in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-$@",'\zs')
    exec printf("inoremap %s %s<C-x><C-n><C-p>", key, key)
endfor
inoremap ./ ./<C-x><C-f><C-p>


set showmode
set title
set laststatus=2

:au BufEnter * execute ":lcd " . expand("%:p:h")

set number
set showmatch
set showcmd

"# show ruler
set ruler

set virtualedit=block

set backspace=indent,eol,start

set ambiwidth=double

set wildmenu
set wildmode=list,full

set history=256

command! NumberToggle call <SID>ToggleNumber()

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

"netrw
let g:netrw_liststyle=3
let g:show_netrw_size=(&columns / 5)

function! s:ShowNetrw()
    execute printf("vsplit | vertical resize %d | e .", g:show_netrw_size)
endfunction

nnoremap <silent> <Space>n :<C-u>call <SID>ShowNetrw()<CR>

let g:tab_size=2
set expandtab
execute 'set tabstop='     . g:tab_size
execute 'set softtabstop=' . g:tab_size
execute 'set shiftwidth='  . g:tab_size

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

