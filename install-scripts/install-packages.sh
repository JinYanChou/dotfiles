log_file=~/install_progress_log.txt

sudo apt-get update
sudo apt-get -y install curl

# ---
# Install zsh
# ---
sudo apt-get -y install zsh autojump
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --skip-chsh"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${HOME}/.oh-my-zsh/custom/plugins/zsh-completions

# ---
# Install tmux
# ---
sudo apt-get -y install tmux
sudo apt-get -y install xsel
if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL!!!" >> $log_file
fi

git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
ln -s -f .tmux/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy"
rm $log_file