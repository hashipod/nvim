
## Installation

NeoVim configuration, use vim-plug to manage plugins.

```bash
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

Happy hacking ~

