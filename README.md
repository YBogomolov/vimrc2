# The Ultimate vimrc 2.0

Over the past year, I've been trying to perfect [Amix's Ultimate Vimrc](https://github.com/amix/vimrc).
This is the result. Amix did an awesome job on his Ultimate vimrc project. Below is a list of [reasons for the fork](#why-the-fork).

## How to install?

	git clone https://github.com/pazams/vimrc2.git ~/.vim_runtime2
	sh ~/.vim_runtime2/install.sh

* note the paths allows this project to co-exist with Amix's project.

## How to install on Windows?

Use [msysgit](http://msysgit.github.com/) to checkout the repository and run the installation instructions above. No special instructions needed ;-)

## How to update to latest version?

Simply just do a git rebase!

    cd ~/.vim_runtime2
    git pull --rebase

## plugin related installations

some plugins depend on external installations, consider installing them:

* google 'XXX install ctags' where XXX should be your OS. [read more on vim and ctags](http://andrew.stwrt.ca/posts/vim-ctags/)
* Install [Ag](https://github.com/ggreer/the_silver_searcher#installing)

* javascript related (requires nodeJS):
* tern_for_vim: cd into ~/.vim_runtime2/sources/languages/tern_for_vim/ and then 'npm install'
* jshint for syntastic: 'npm install -g jshint'

* windows users should consider installing python, as some plugins require it 

## Included Plugins

Here is a partial list of the included plugins. Read the docs of these plugins to understand them better. 

* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manages the runtime path of the plugins
* [YankStack](https://github.com/maxbrunsfeld/vim-yankstack):  A lightweight implementation of emacs's kill-ring for vim 
* [UltiSnips](https://github.com/SirVer/ultisnips): UltiSnips - The ultimate snippet solution for Vim
* [NERD Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [ag.vim](https://github.com/rking/ag.vim): A much faster Ack
* [ctrlp.vim](https://github.com/kien/ctrlp.vim): Fuzzy file, buffer, mru and tag finder. In my config it's mapped to `<Ctrl+F>`, or <leader>j
* [vim-airline](https://github.com/bling/vim-airline): Lean & mean status/tabline for vim that's light as air (replacing powerline)
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [syntastic](https://github.com/scrooloose/syntastic): Syntax checking hacks for vim

## Included color schemes

* [vim-tomorrow-theme](https://github.com/chriskempson/vim-tomorrow-theme)
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)

## How to include your own stuff?

After you have installed the setup you can create **~/.vim_runtime2/vimrcs/my_configs.vim** to fill in any configurations that are important for you. For instance, [here is see my personal, opinionated configuration](https://gist.github.com/pazams/216856a04eabe1cd8bda)

You can also install your own plugins, for instance, via pathogen we can install [vim-rails](https://github.com/tpope/vim-rails):

	cd ~/.vim_runtime2/sources/core/
	git clone git://github.com/tpope/vim-rails.git 
	
## Key Mappings

### Plugin related mappings

[ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin:
    
    fuzzy file search:  '<c-f>'     OR      <leader>j
    Buffer explorer:    '<c-ff>'    OR      <leader>o
    MRU:                '<c-fff>'   OR      <leader>j
    Tags explorer       '<c-ffff>'  OR      <leader>h
    
Managing the [NERD Tree](https://github.com/scrooloose/nerdtree) plugin:

    NERDTreeToggle:        <leader>nn 
    NERDTreeFromBookmark:  <leader>nb
    NERDTreeFind:          <leader>nf 

[ag.vim](https://github.com/rking/ag.vim) plugin:

    Ag: <leader>g

[gitgutter](https://github.com/airblade/vim-gitgutter) plugin:

    GitGutterToggle: <leader>b

[tagbar](https://github.com/majutsushi/tagbar) plugin:

    TagbarToggle: <F8> 

### Normal mode mappings

Fast saving of a buffer:

	nmap <leader>w :w!<cr>

Treat long lines as break lines (useful when moving around in them):

	map j gj
	map k gk
	
Map `<Space>` to `/` (search) and `<Ctrl>+<Space>` to `?` (backwards search):
	
	map <space> /
	map <c-space> ?
	map <silent> <leader><cr> :noh<cr>

Disable highlight when `<leader><cr>` is pressed:
	
	map <silent> <leader><cr> :noh<cr>

Smart way to move between windows:
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of current buffer(s):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :1,1000 bd!<cr>
	
Useful mappings for managing tabs:
	
	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
	
Switch CWD to the directory of the open buffer:
	
	map <leader>cd :cd %:p:h<cr>:pwd<cr>
	
Remove the Windows ^M - when the encodings gets messed up:
	
	noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
	
Quickly open a buffer for scripbble:
	
	map <leader>q :e ~/buffer<cr>

Toggle paste mode on and off:
	
	map <leader>pp :setlocal paste!<cr>


### Insert mode mappings

Quickly insert parenthesis/brackets/etc.:

    inoremap $1 ()<esc>i
    inoremap $2 []<esc>i
    inoremap $3 {}<esc>i
    inoremap $4 {<esc>o}<esc>O
    inoremap $q ''<esc>i
    inoremap $e ""<esc>i
    inoremap $t <><esc>i

Insert the current date and time (useful for timestamps):

    iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you vimgrep after the selected text:

	vnoremap <silent> gv :call VisualSelection('gv')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

Surround the visual selection in parenthesis/brackets/etc.:

    vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    vnoremap $q <esc>`>a'<esc>`<i'<esc>
    vnoremap $e <esc>`>a"<esc>`<i"<esc>
	

### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Spell checking
Pressing `<leader>ss` will toggle and untoggle spell checking

    map <leader>ss :setlocal spell!<cr>

Shortcuts using `<leader>` instead of special chars

    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=

### Cope	
Do :help cope if you are unsure what cope is. It's super useful!

When you search with vimgrep, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Vimscript mappings:

    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>

## Useful tips From Amix

* [Folding in Vim](http://amix.dk/blog/post/19132#Folding-in-Vim)

# Why the fork?

* Restructured plugins directories into: color-schemes  core  languages  snippets
* Use [ctrlp.vim](https://github.com/kien/ctrlp.vim) as the default for MRU and Buffer explorer
* replaced zencoding with emmet
* replaced yankring  with yankstack 
* replaced snipmate  with ultisnips   
* replaced taglist   with tagbar
* added 'plugin related installations' instructions to README
* more js oriented (tern plugin, and more to come)
