# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# symlinks
ln -s $PWD/.tmux.conf ~/.tmux.conf
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/bashit/mday_powerline ~/.bash_it/themes/mday_powerline
ln -s $PWD/bashit/mday_pete ~/.bash_it/themes/mday_pete

# edit .bashrc
# mday theme currently broken because powerline multiline is currently broken
sed -i 's/export BASH_IT_THEME=\x27.*\x27/export BASH_IT_THEME=\x27pete\x27/g' ~/.bashrc
echo "source $PWD/lqs_bashrc.sh" >> ~/.bashrc


