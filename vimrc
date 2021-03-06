"==================================================
"VIMRC
"==================================================
"use vim-plug: https://github.com/junegunn/vim-plug
"
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'ianding1/leetcode.vim'
Plug 'tpope/vim-fugitive'
"Plug 'buoto/gotests-vim'
"Plug 'tpope/vim-fugitive'
"Plug 'ervandew/supertab'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'

call plug#end()            
filetype plugin indent on  
filetype plugin on

filetype on
syntax enable

set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set softtabstop=4
set cindent
set nu
set ruler
set background=dark
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set textwidth=200
set cursorline                          "突出显示当前行
set nobackup                            "禁止备份文件
set noswapfile                          "禁止交换文件
"set autochdir                          "自动切换工作目录为当前目录,开启后cscope会报错
set backspace=indent,eol,start          "修复退格键无法使用的问题
set hlsearch
set noerrorbells                        "关闭报警声
set completeopt-=preview                "关闭新开窗口提示函数参数信息
set mouse=a
set incsearch
colorscheme molokai
"macvim---------------"
set guifont=Monaco:h13
let mapleader = ","

imap [ []<ESC>i
imap { {}<ESC>i
imap ( ()<ESC>i
inoremap " ""<ESC>i<ESC>a
autocmd FileType c,cpp,go imap { {<CR>}<ESC>O

"==============emacs style movement==============
imap <C-h> <ESC>i
imap <C-l> <ESC>la
imap <C-a> <C-o>0
imap <C-e> <C-o>$
imap <C-f> <ESC>la
imap <C-b> <ESC>i

"==============zoom window==============
nmap <C-=> <C-W>+
nmap <C--> <C-W>-

"==============navigate==============
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

"==============terminal mode==============
"打开terminal
nmap <leader>t :sp<CR><C-w>j:term<CR>:res-15<CR>  
"退出terminal
tnoremap <Esc> <C-\><C-n>

"===============buffer config===============
set hidden
nmap - :bprevious<CR>
nmap = :bnext<CR>
" delete buffer
nmap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

"===============tab config===============
set laststatus=2
nmap <C-c> :tabclose<CR>
nmap _ :tabprevious<CR>
nmap + :tabnext<CR>

"=====================nerdtree=====================
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"=====================taglist/tagbar=====================
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
map t :TagbarToggle<CR>  
"let tagbar_left = 1
"autocmd VimEnter * TlistOpen

"======================ctrlp======================
let g:ctrlp_extensions = ['buffertag', 'line', 'dir']

"=====================vim-go=====================
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
"let g:go_addtags_transform = "camelcase"
"let g:go_auto_type_info = 1

"=====================alrline=====================
let g:airline_powerline_fonts = 1
let g:airline_theme='serene'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"=====================YCM=====================
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:python3_host_prog = '/usr/bin/python3'
"

if filereadable("cscope.out") 
    cs add cscope.out 
endif
if has("cscope")
   set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
   " check cscope for definition of a symbol before checking ctags:
   " set to 1 if you want the reverse search order.
    set csto=1

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB !=""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

"===============LEETCODE==================
let g:leetcode_china=1
let g:leetcode_solution_filetype='golang'
let g:leetcode_browser='chrome'
let g:leetcode_hide_paid_only=1

