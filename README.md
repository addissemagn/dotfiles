# 💻 dotfiles
some personal dotfiles

## setup
1. [vim](#vim)

## vim
to configure on new machine 

```sh
# install plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# caution: will REPLACE current machines .vimrc with this one
curl https://raw.githubusercontent.com/addissemagn/dotfiles/master/.vimrc
    --output ~/.vimrc
```

### install plugins
open `~/.vimrc` and install plugins,

```sh
vim ~/.vimrc
```

run `:PlugClean` to remove unused plugins.

run `:PlugInstall` to install plugins. 

once complete, run `:source %` to source current vim config.

### plugin specific setup

#### [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
required for YCM to work (otherwise remove YCM from plugin list to avoid errors)
```sh
# install requirements
sudo yum install -y cmake macvim python
sudo yum install -y mono go nodejs

# compile YCM
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
```

#### [FuzzyFinder](https://github.com/junegunn/fzf)
optional: to use the `:Ag` command for searching within files, install [ag](https://github.com/ggreer/the_silver_searcher)
```sh
sudo yum install -y silversearcher-ag
```

#### ctags
indexes methods, variables, and other identifiers for easy navigation
```sh
sudo yum install -y ctags
```

#### [powerfonts](https://github.com/powerline/fonts)
for spicing up the status bar
```sh
sudo yum install fonts-powerline
```

### misc setup
#### swp files
make directory for cleaner swap file storage
```sh
mkdir ~/.vimswap
```
