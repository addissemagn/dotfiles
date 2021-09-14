# 💻 dotfiles
how i like things

for quick setup on remote machines:
```sh
# will REPLACE current config
curl https://raw.githubusercontent.com/addissemagn/dotfiles/master/.vimrc --output ~/.vimrc
curl https://raw.githubusercontent.com/addissemagn/dotfiles/master/.bashrc --output ~/.bashrc
curl https://raw.githubusercontent.com/addissemagn/dotfiles/master/.tmux.conf --output ~/.tmux.conf
```

[config specific / dev environment setup](https://gist.github.com/addissemagn/db3aee841b374199ada608ea0b188479)

other: 
* install [oh my zsh](https://ohmyz.sh/): `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" `

TODO:
- [ ] make setup script


### setup-mac.sh
```bash
#!/bin/sh
    
# replace curr .vimrc
curl https://gist.githubusercontent.com/addissemagn/40ce5b24ece837b871f3e10b5adbdc73/raw/.vimrc > ~/.vimrc

# install plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins
vim +'PlugInstall --sync' +qa

# setup YouCompleteMe
brew install cmake macvim python
brew install mono go nodejs
python ~/.vim/plugged/YouCompleteMe/install.py --all

# setup fuzzyfinder ag
brew install the_silver_searcher

# make directory for cleaner swap file storage
mkdir ~/.vimswap
```
