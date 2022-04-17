git clone https://github.com/jdhao/nvim-config.git ~/.config/nvim/
cd ~/.config/nvim/
rm -f init.vim
ln -s /data/soft/git/myscripts/init.vim
pip install -U pynvim
pip install 'python-lsp-server[all]' pylsp-mypy pyls-isort
apt -y install nodejs npm clangd
npm install -g vim-language-server
scp -P57575 ov2.7576.tk:~/.config/nvim/lua/config/autosave.lua ~/.config/nvim/lua/config/
scp -P57575 ov2.7576.tk:~/.config/nvim/lua/plugins.lua ~/.config/nvim/lua/

ln -s /usr/local/share/vim/vimrc /usr/local/share/nvim/sysinit.vim
ln -s /usr/local/share/vim/vim82/vimrc_example.vim /usr/local/share/nvim/runtime/
ln -s /usr/local/share/vim/vim82/defaults.vim /usr/local/share/nvim/runtime/


#rm -rf /data/soft/git/neovim/build/
#git pull
#make CMAKE_BUILD_TYPE=Release
