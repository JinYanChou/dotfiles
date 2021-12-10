set encoding=utf-8
set fileencodings=utf-8,cp950

syntax on        "語法上色顯示
set ai           "自動縮排
set paste        "設定貼上模式
set tabstop=4    "縮排間隔數
set shiftwidth=4 "設定縮排寬度4
set expandtab    "用 space 代替 tab
set ruler        "顯示右下角參數,如第幾行第幾個字
set backspace=2  "在 insert 也可用 backspace
set ic           "設定搜尋忽略大小寫
set hlsearch     "設定高亮度顯示搜尋結果
set incsearch    "在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  "設定 smartindent
set confirm      "操作過程有衝突時，以明確的文字來詢問
set history=200  "保留 200 個使用過的指令

set number
:nohl            "搜尋不會有底色
:set nowrap      "字串太長不自動換行

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tomasiser/vim-code-dark' " 新增色系的 Plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

" 設定 F5 快速鍵，開啟樹狀目錄
map <F5> :NERDTreeTabsToggle<CR>
map <F6> :NERDTreeTabsOpen<CR>:NERDTreeTabsFind<CR>

" 設定顏色
colorscheme codedark

" 啟用Tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
