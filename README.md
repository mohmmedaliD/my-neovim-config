# neovim-config

## install packages
```
sudo apt install -y neovim fd-find silversearcher-ag fuse libfuse2 git python3-pip ack-grep
```
```
sudo npm i -g npm install -g intelephense
```
## add files
```
mkdir ~/.config/nvim
```
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
copy all files to ~/.config/nvim/
## add configuration 
```
nvim
```
```
:PlugInstall
```
```
:CocInstall coc-tabnine coc-snippets coc-marketplace coc-lightbulb coc-html coc-git coc-gist coc-eslint coc-cssmodules coc-vimlsp coc-vetur coc-tsserver coc-tslint coc-sql coc-python coc-phpls coc-php-cs-fixer coc-markmap coc-json coc-htmlhint coc-css coc-blade 
```

# add to .bashrc
```
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
```
