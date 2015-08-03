"コメント
"  表示


"画面表示の設定
"行番号追加
set number

set cursorline     " カーソル行の背景色を変える
"set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
"set list           " 不可視文字を表示


" 補完
set wildmenu    "Vimコマンドの補完を行ってくれる
"  検索
set hlsearch    "タブキーを空白に変換

"  タブ関連
" タブの画面上での幅
set tabstop=2
" インデントの設定をファイルタイプ別に行う
"   (shiftwidth=スマートインデントの幅)
"   (tabstop=タブの画面上での幅)
"   (softtabstop=??? デフォルトは tabstop と同じらしい)
augroup vimrc
autocmd! FileType perl setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd! FileType css  setlocal shiftwidth=4 tabstop=2 softtabstop=2
augroup END

" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
    " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan


"カラースキーマ
colorscheme torte
syntax on

"オートインデント
"改行時に半角スペース８文字を自動挿入する
set autoindent
set smartindent
"改行時に入力された行の末尾に合わせて次の行のインデントを増減する


"タブを押すと空白2個が挿入される
set expandtab
set shiftwidth=2
set softtabstop=2

" マウスの入力を受け付ける
"set mouse=a

" コマンドラインの設定
"
"コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=1000

"澤田使用aa
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <S-h> <C-w><
nnoremap <S-j> <C-w>+
nnoremap <S-k> <C-w>-
nnoremap <S-l> <C-w>>


"超絶高橋さん仕様

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'rking/ag.vim'
NeoBundle 'yegappan/mru'
NeoBundle 'vim-scripts/opsplorer'
NeoBundle "slim-template/vim-slim"
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'cakebaker/scss-syntax.vim'

au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" 行末の空白文字をハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
