"#----------------------------------------------------------#
"# 基本設定                                                 # 
"#----------------------------------------------------------#

"# vi互換のoff
set nocompatible

" 強制終了をoff
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap ; :
nnoremap " ;

"# カラースキームの設定
colorscheme default

"# シンタックスハイライト
syntax on

"# 保存なしで他のファイルを開ける
set hidden

"# Window幅で折り返す
set wrap

"# scroll時の最小行数値
set scrolljump=15

"# 高速ターミナル接続
set ttyfast

"# Plug-in有効設定
filetype plugin indent on
filetype plugin on

"# ESCキー
noremap  <C-@> <ESC>
noremap! <C-@> <ESC>
cnoremap <C-@> <C-c>

"# ステータスライン
set statusline=%F%m%r%h%w\ 
            \[FORMAT=%{'['.(&fenc!=''?&fenc:'?').'::'.&ff.']'}]\ 
            \[TYPE=%Y]\ 
            \[ASCII=\%03.3b]\
            \[HEX=\%02.2B]\
            \[POS=%04l,%04v][%p%%]\
            \[LEN=%L]

"# modeでラインの色を変える
highlight StatusLine ctermfg=DarkYellow ctermbg=DarkGreen cterm=none
autocmd InsertEnter * :highlight StatusLine ctermfg=White ctermbg=Blue
autocmd InsertLeave * :highlight StatusLine ctermfg=DarkYellow ctermbg=DarkGreen

"# ESCの遅延防止
if has('unix') && !has('gui_running')
    inoremap <silent> <ESC> <ESC>
    inoremap <silent> <C-[> <ESC>
endif

" helpを引く
nnoremap <C-h> :help<Space>

"# modeを表示する
set showmode
"# タイトルを表示
set title
"# 常にステータス行を表示
set laststatus=2

"# バッファを開いた時に、カレントディレクトリを自動で移動
:au BufEnter * execute ":lcd " . expand("%:p:h")

"# 行番号を表示設定
set number
"# 括弧入力時に対応する括弧を表示
set showmatch
"# コマンドをステータス行に表示
set showcmd

"# ルーラーを表示
set ruler

"# Visual blockモードでフリーカーソルを有効にする
set virtualedit=block

"# バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start

"# 2バイト文字でもカーソル位置がずれないようにする
set ambiwidth=double

"# コマンドライン補完するときに強化されたものを使う
set wildmenu
"# ファイル名補完に候補のリストを表示
set wildmode=list,full

"# コマンドラインの履歴の保存数
set history=256

"# LineNumberのトグル
command! NumberToggle :<SID>call ToggleNumber()

function! s:ToggleNumber()
    if &number == '1'
        echo "line number enable"
    else
        echo "line number disable"
    endif
    set number!
endfunction


"# 検索に大文字を含んでいたら大小区別
set ignorecase
set smartcase

"# 検索時にヒット部位をハイライト
set hlsearch

"# 検索ハイライト消去
nnoremap <ESC><ESC> :nohl<CR>
nnoremap <C-@><C-@> :nohl<CR>
nnoremap <C-c><C-c> :nohl<CR>

"# 検索時にインクリメンタルサーチを行う
set incsearch

"# カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>

"# インデント
set autoindent
set smartindent
set smarttab
"# if(){}などのインデント
set cindent

"# タブを空白に置き換える
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

"# {}をインデントして入力
inoremap {<CR> {<CR>}<LEFT><CR><UP><TAB>

"Encoding 
set enc=utf-8 
set fenc=utf-8 
set fencs=utf-8 

"# Window横分割
nnoremap <Space>w :<ESC>:new<CR>
"# Window縦分割
nnoremap <Space>v :<ESC>:vnew<CR>

"# カレントWindow縦最大化
nnoremap <C-w><C-w> <C-w>_
nnoremap <C-w>w <C-w>_

"# Window大きさ均等化
nnoremap <C-\> <C-w>=

"# 縦最大化しつつWindowを移動
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_

"# Window移動
nnoremap <C-w><C-j> <C-w>j
nnoremap <C-w><C-k> <C-w>k
nnoremap <C-w><C-h> <C-w>h
nnoremap <C-w><C-l> <C-w>l

"__END__
