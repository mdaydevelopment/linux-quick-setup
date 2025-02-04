# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symlinks
ln -s $PWD/.tmux.conf ~/.tmux.conf
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/bashit/mday ~/.bash_it/themes/mday

# edit .bashrc
# mday theme currently broken because powerline multiline is currently broken
sed -i 's/export BASH_IT_THEME=\x27.*\x27/export BASH_IT_THEME=\x27pete\x27/g' ~/.bashrc
echo '# default editor'                     >> ~/.bashrc
echo 'export VISUAL=vim'                    >> ~/.bashrc
echo 'export EDITOR="$VISUAL"'              >> ~/.bashrc
echo 'eval "$(thefuck --alias)"'            >> ~/.bashrc


