## gvimrc-for-windows
这是我的gvim配置文件（windows下）

安装方式：

1. 执行 ```git clone https://github.com/windcode/gvimrc-for-windows.git```

2. 执行 ```git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim``` 安装vundle

3. 将 _vimrc 文件放到 ```[vim安装目录]/``` 下

4. 打开gvim，在命令模式下输入 ```:PluginInstall```,回车

5. 将 gvim 文件放入你的 ```[git安装目录]/bin``` 文件夹下

6. 打开 gvim 文件，修改exec后的内容为 ```[vim安装目录]/vim74/gvim "$@" &```

