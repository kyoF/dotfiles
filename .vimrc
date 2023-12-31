" 文字コードをutf8に設定
set fenc=utf-8
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" 現在の行を強調表示
set cursorline
" 行番号を表示
set number
" 対応する括弧を強調表示
set showmatch
" タブキーの文字幅
set softtabstop=2
" 検索結果をハイライト表示
set hlsearch
" 対応する括弧を表示
set showmatch matchtime=1
" ステータスラインを常に表示
set laststatus=2
" タブ文字の表示幅
set tabstop=2
" vimが挿入するインデント幅
set shiftwidth=2

" html/xml閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" NTでnerdtreeを開く
:command NT NERDTree

call plug#begin('~/.vim/plugged')
  " ファイルを素早く開く
  Plug 'Shougo/unite.vim'
  " ファイル一覧表示
  Plug 'preservim/nerdtree'
  " カラースキーマ
  Plug 'tomasr/molokai'
  " コメントのON/OFF
  Plug 'tomtom/tcomment_vim'
  " Gitを使う
  Plug 'tpope/vim-fugitive'
  " インデントを可視化
  Plug 'nathanaelkane/vim-indent-guides'
  let g:indent_guides_enable_on_vim_startup = 1
  " statuslineをカッコよく
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme molokai
