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
" �ļ�������
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


" ԭ��
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

" ��ݼ�
"  �л��ָ��
map <C-h>  <C-w>h	
map <C-l>  <C-w>l
map <C-j>  <C-w>j
map <C-k>  <C-w>k

map nt :NERDTree<CR>

" ���ö����Ի���,���������������
if has("multi_byte") 
    " UTF-8 ���� 
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

" �����﷨����
set nu!

colorscheme desert 
syntax enable 
syntax on

" ��������ת
" ��ec57w32.zip��ѹ���ڽ�ѹ���ļ����е�ctags.exe���Ƶ�
" D:\ProgramFiles\Vim\vim73�£����༭_vimrc�ļ�������������ݣ� 
set tags=tags;
set autochdir
" Ȼ��D:\ProgramFiles\Vim\vim73�ӵ�����������path�С�
" ����Ҫ�鿴��Դ����Ŀ¼��ִ������ctags -R��Ȼ������gvim��Դ�����ļ�
" ��ס��CTRL�����������Ӧ�ĺ�������CTRL+]����
" ���Զ���ת�������Ķ��岿�֣���CTRL+T���򷵻أ�


" Դ����������� taglist
" ��taglist_45.zip��ѹ����ѹ�����һ��doc�ļ��к�һ��plugin�ļ��У�
" ���������ݷֱ��Ƶ�d:\Program Files\Vim\vim73�µ�doc��plugin�С� 
" ��_vimrc�ļ��м����������ݣ� 
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1
" ��gvim�򿪴����ļ��������ɹ�tags�ļ���������:Tlist��
" TagList���ڼ���������ࡣ�����룺:Tlist���������ʧ��
" ������г��˵�ǰ�ļ��е����к�,  ȫ�ֱ���,  ��������,  
" �ڲ鿴����ʱ�������������ȫ��,  �л�λ���൱����
