cd ~/.vim_runtime2

echo 'set runtimepath+=~/.vim_runtime2

source ~/.vim_runtime2/vimrcs/basic.vim
source ~/.vim_runtime2/vimrcs/filetypes.vim
source ~/.vim_runtime2/vimrcs/plugins_config.vim
source ~/.vim_runtime2/vimrcs/extended.vim
source ~/.vim_runtime2/vimrcs/neovim.vim

try
source ~/.vim_runtime2/vimrcs/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
