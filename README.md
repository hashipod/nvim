
## Installation

NeoVim configuration, use vim-plug to manage plugins.

```bash
# clone this repo
git clone --depth 1 https://github.com/jieteki/nvim.git ~/.config/

# install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

# install fd, SEE https://github.com/sharkdp/fd
# set fd as fzf backend
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --exclude node_modules'

# start nvim and install plugins
nvim +PlugInstall +qall

# plugins will be installed in ~/.nvim

```

Happy hacking ~

