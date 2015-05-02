" Vundle conifg 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
" 文件管理器
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" 原配
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" 快捷键
"  切换分割窗口
map <C-h>  <C-w>h	
map <C-l>  <C-w>l
map <C-j>  <C-w>j
map <C-k>  <C-w>k

map nt :NERDTree<CR>

" 配置多语言环境,解决中文乱码问题
if has("multi_byte") 
    " UTF-8 编码 
    set encoding=utf-8 
    set termencoding=utf-8 
    set formatoptions+=mM 
    set fencs=utf-8,gbk 
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)' 
        set ambiwidth=double 
    endif 
    if has("win32") 
        source $VIMRUNTIME/delmenu.vim 
        source $VIMRUNTIME/menu.vim 
        language messages zh_CN.utf-8 
    endif 
else 
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte" 
endif

" 设置语法高亮
set nu!

colorscheme desert 
syntax enable 
syntax on

" 程序中跳转
" 将ec57w32.zip解压，在解压后将文件夹中的ctags.exe复制到
" D:\ProgramFiles\Vim\vim73下，并编辑_vimrc文件，添加以下内容： 
set tags=tags;
set autochdir
" 然后将D:\ProgramFiles\Vim\vim73加到环境变量的path中。
" 在需要查看的源代码目录下执行命令ctags -R；然后再用gvim打开源代码文件
" 按住“CTRL”键，点击对应的函数名或“CTRL+]”，
" 会自动跳转到函数的定义部分，“CTRL+T”则返回；


" 源代码分析工具 taglist
" 将taglist_45.zip解压，解压后包含一个doc文件夹和一个plugin文件夹，
" 将其中内容分别复制到d:\Program Files\Vim\vim73下的doc及plugin中。 
" 在_vimrc文件中加入以下内容： 
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
" 用gvim打开代码文件（已生成过tags文件），输入:Tlist，
" TagList窗口即出现在左侧。再输入：:Tlist，左侧栏消失；
" 左侧栏列出了当前文件中的所有宏,  全局变量,  函数名等,  
" 在查看代码时用这个窗口总揽全局,  切换位置相当方便
