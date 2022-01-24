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

" html/xml閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" ctrl+eでnerdtreeを開く
:command NT NERDTree

"Start deins-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=/Users/kyosukefujiki/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/dotfiles/.vim/dein')
  call dein#begin('~/dotfiles/.vim/dein')

  let s:toml = '~/dotfiles/.vim/dein/dein.toml'
  call dein#load_toml(s:toml, {'lazy':0})

  call dein#end()
  call dein#save_state()
endif

colorscheme molokai

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein-------------------------
