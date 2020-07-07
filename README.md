# 💻 dotfiles
for set up on remote machines / if i ever reinstall WSL bc it's not working, unknowingly wiping my environment

## setup
1. [vim](#vim)
2. [dev environment](#environment)

## vim
```sh
# install plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# will REPLACE current machines .vimrc with this one
curl https://raw.githubusercontent.com/addissemagn/dotfiles/master/.vimrc --output ~/.vimrc
```

### install plugins
in `~/.vimrc` run `:PlugInstall` then `:source %` to source current vim config.

### plugin specific setup
- [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe): required for YCM to work (otherwise remove YCM from plugin list to avoid errors)
- [FuzzyFinder](https://github.com/junegunn/fzf): for searching within files, install [ag](https://github.com/ggreer/the_silver_searcher)
- ctags: indexes methods, variables, and other identifiers for easy navigation
- [powerfonts](https://github.com/powerline/fonts): for spicing up the status bar

```sh
sudo yum update

# -- YOUCOMPLETEME
# install requirements
sudo yum install -y cmake macvim python3 python3-dev
sudo yum install -y mono go nodejs
cd ~/.vim/plugged/YouCompleteMe # or cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

# -- FUZZYFINDER
sudo yum install -y silversearcher-ag  

# -- CTAGS
sudo yum install -y ctags

# -- POWERFONTS
sudo yum install fonts-powerline
```

### misc setup
```sh
# make directory for cleaner swap file storage
mkdir ~/.vimswap
```

## environment
### web dev
```sh
# -- NODE + NPM
# install node version manager (nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
# activate nvm
. ~/.nvm/nvm.sh
# install latest version of Node.js
nvm install node
# Test
node -v

# -- YARN
sudo apt install -y --no-install-recommends yarn
```

### python
```sh
sudo apt install -y python3 python3-pip python3-dev gcc
```

### java
```sh

```
