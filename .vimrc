autocmd BufRead,BufNewFile *.py setfiletype python
autocmd BufRead,BufNewFile *.rb setfiletype ruby
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

"--------------------------------------------------------------------------
" neobundle
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
        \ string(neobundle#get_not_installed_bundle_names())
  echomsg 'Please execute ":NeoBundleInstall" command.'
  "finish
endif

"GitHubリポジトリにあるプラグインを利用場合
NeoBundle 'tpope/vim-fugitive'

"GitHub以外のGitリポジトリにあるプラグインを利用する場合
NeoBundle 'git://git.wincent.com/command-t.git'

"Git以外のリポジトリにあるプラグインをを利用する場合
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
 NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

NeoBundle 'scrooloose/nerdtree'

"カラースキーマ
colorscheme desert
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

call neobundle#end()
