
## Installation

NeoVim configuration, use vim-plug to manage plugins.

```bash
# install nvim nightly. appimage is the fastest way.
# curl -o /usr/local/bin/nvim -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage && chmod +x /usr/local/bin/nvim


# clone this repo
mkdir -p ~/.config && cd ~/.config && git clone --depth 1 https://github.com/jieteki/nvim.git

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install fd, SEE https://github.com/sharkdp/fd
# brew install fd

# install python2 & python3 support
python3 -m pip install --user --upgrade pynvim
python2 -m pip install --user --upgrade pynvim

# start nvim and install plugins
nvim +PlugInstall +qall

# install clap binary: maple, SEE https://github.com/liuchengxu/vim-clap/blob/master/INSTALL.md#download-the-prebuilt-binary-from-github-release
:call clap#installer#download_binary()

# install ctags with json: SEE https://github.com/liuchengxu/vista.vim#compile-ctags-with-json-format-support
brew tap universal-ctags/universal-ctags
brew install --with-jansson --HEAD universal-ctags/universal-ctags/universal-ctags

# install lua lsp if needed

:LspInstall sumneko_lua

# plugins will be installed in ~/.nvim

```

## For cpp

first install clangd

```
pacman -Sy clangd
```

clangd need `compile_commands.json` at project root,
add this line in your CMakeLists.txt, for generating `compile_commands.json` file.

```
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
```

make a softlink in project root.
```
ln -s path/to/compile_commands.json .
```

## For cscope

first install cscope & ctags
```
pacman -Sy cscope ctags
```

use this script to generate cscope files

```bash
#!/bin/sh
find . -path "./.ccls-cache" -prune -o -path "./.git" -prune \
    -o -name "*.h" -o -name "*.hh" -o -name "*.hpp" \
    -o -name "*.c" -o -name "*.cc"  | \
    egrep -v '.ccls-cache|.git' | sort > .cscope.files
    
cscope -bkq -i .cscope.files -f .cscope.out
ctags --c++-kinds=+p --fields=+iaS --exclude=".ccls-cache/*" -R -f .tags
```

it will generate the following files:

```
.cscope.files
.cscope.out
.cscope.out.in
.cscope.out.po
.tags
```
you may need to ignore them in .gitignore

in our vimrc, use `CTRL-\ g` to jump to definitions.

Happy hacking ~

