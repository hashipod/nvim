
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
# set fd as fzf backend
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --exclude node_modules'

# install python support
sudo pip install neovim && sudo pip3 install neovim

# start nvim and install plugins
nvim +PlugInstall +qall

# plugins will be installed in ~/.nvim

```

Happy hacking ~

