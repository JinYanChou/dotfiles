log_file=~/install_progress_log.txt

# ---
# Install zsh
# ---
sudo yum install zsh util-linux-user python2 -y
sudo ln -s /usr/bin/python2 /usr/bin/python
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --skip-chsh"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${HOME}/.oh-my-zsh/custom/plugins/zsh-completions

git clone https://github.com/joelthelion/autojump.git
cd autojump
./install.py
cd ${HOME}

# ---
# Install tmux
# ---
sudo yum -y install tmux
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL!!!" >> $log_file
fi

git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
ln -s -f .tmux/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

# ---
# Install vundle
# ---
git clone https://github.com/gmarik/vundle.git ${HOME}/.vim/bundle/vundle
ln -s -f dotfiles/vimrc ~/.vimrc
#vim +BundleInstall +qall 2&> /dev/null

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy"
rm $log_file