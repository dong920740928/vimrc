" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'Valloric/YouCompleteMe' 

let g:ycm_confirm_extra_conf = 0
"let g:loaded_youcompleteme = 1

Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

Plugin 'scrooloose/nerdtree'

Plugin 'rdnetto/YCM-Generator'

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_check_header = 1

"NERDtee设定
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
nnoremap f :NERDTreeToggle
map <F7> :NERDTree<CR>  

Plugin 'vim-scripts/taglist.vim'

nnoremap t :TlistToggle

Plugin 'scrooloose/nerdcommenter'

Plugin 'Chiel92/vim-autoformat'

let g:autoformat_verbosemode=1

Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"打开文件类型检测, 加了这句才可以用智能补全

map <F9> :call SaveInputData()<CR>
func! SaveInputData()
	exec "tabnew"
	exec 'normal "+gP'
	exec "w! /tmp/input_data"
endfunc

execute pathogen#infect()

if !exists("g:syntax_on")
    syntax enable
endif

if has('gui_running')
    set background=light
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
else
    set background=dark
endif

" 设置配色方案
"colorscheme torte
"colorscheme murphy
"colorscheme desert 
"colorscheme elflord
"colorscheme ron
colorscheme solarized



"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,cp936
"set fileencoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"winpos 5 5          " 设定窗口位置  
"set lines=40 columns=155    " 设定窗口大小  
"set go=             " 不要图形按钮  
"color asmanian2     " 设置背景主题  
"set guifont=Courier_New:h10:cANSI   " 设置字体  
"split style
set splitbelow
set splitright
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
"set showcmd         " 输入的命令显示出来，看的清楚些  
"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
"set novisualbell    " 不要闪烁(不明白)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set foldenable      " 允许折叠  

if version >= 603
	set helplang=en
	set encoding=utf-8
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile *.cpp call SetCPP()
autocmd BufNewFile *.[ch] call SetC()
autocmd BufNewFile *.sh call SetBash()
autocmd BufNewFile *.py call SetPython()

func SetCPP()
	call setline(1, "/*************************************************************************")
	call append(line("."), "	> File Name: ".expand("%"))
	call append(line(".")+1, "	> Author: dong920740928")
	call append(line(".")+2, "	> Mail: dong920740928@gmail.com")
	call append(line(".")+3, "	> Created Time: ".strftime("%c"))
	call append(line(".")+4, " ************************************************************************/")
	call append(line(".")+5, "")
    call append(line(".")+6, "\#include <iostream>")
    call append(line(".")+7, "")
	normal G
endfunc

func SetC()
	call setline(1, "/*************************************************************************")
	call append(line("."), "	> File Name: ".expand("%"))
	call append(line(".")+1, "	> Author: dong920740928")
	call append(line(".")+2, "	> Mail: dong920740928@gmail.com")
	call append(line(".")+3, "	> Created Time: ".strftime("%c"))
	call append(line(".")+4, " ************************************************************************/")
	call append(line(".")+5, "")
    call append(line(".")+6, "\#include <stdio.h>")
    call append(line(".")+7, "")
	normal G
endfunc

func SetBash()
	call setline(1,"\#########################################################################") 
	call append(line("."), "\# File Name: ".expand("%")) 
	call append(line(".")+1, "\# Author: dong920740928") 
	call append(line(".")+2, "\# mail: dong920740928@gmail.com") 
	call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
	call append(line(".")+4, "\#########################################################################") 
	call append(line(".")+5, "") 
	call append(line(".")+6, "\#!/bin/bash") 
	call append(line(".")+7, "") 
	normal G
endfunc

func SetPython()
    call setline(1, "\#-*- coding: utf-8 -*-")
    call append(line("."), "\########################################################################")
	call append(line(".")+1, "\# File Name: ".expand("%"))
	call append(line(".")+2, "\# Auhtor: dong920740928")
	call append(line(".")+3, "\# Mail: dong920740928@gmail.com")
	call append(line(".")+4, "\# Created Time: ".strftime("%c"))
	call append(line(".")+5, "\#########################################################################")
    call append(line(".")+6, "")
	call append(line(".")+7, "\#!/usr/bin/python")
    call append(line(".")+8, "")
	normal G
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nmap <leader>w :w!<cr>
""nmap <leader>f :find<cr>

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"新建标签  
map <M-F2> :tabnew<CR>  
"列出当前目录文件  
""map <F3> :tabnew .<CR>  
"打开树状文件目录  
""map <C-F3> \be  
"C，C++ 按F5编译运行
""map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunc
"C,C++的调试
""map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
""set autoread
" quickfix模式
""autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
""set completeopt=preview,menu 
"共享剪贴板  
set clipboard+=unnamed 
"从不备份  
""set nobackup
"make 运行
"":set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
""set magic                   " 设置魔术
""set guioptions-=T           " 隐藏工具栏
""set guioptions-=m           " 隐藏菜单栏
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
""set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
" 用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
""set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=en_US.utf8
set helplang=en
" 我的状态行显示的内容（包括文件类型和解码）
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt
"自动补全
"":inoremap ( ()<ESC>i
"":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
"":inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
"set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
