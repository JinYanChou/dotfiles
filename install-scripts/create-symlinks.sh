#!/bin/zsh
#===============================================================================
#
#             NOTES: For this to work you must have cloned the github
#                    repo to your home folder as ~/dotfiles/
#
#===============================================================================

#==============
# Variables
#==============
dotfiles_dir=~/dotfiles
log_file=~/install_progress_log.txt
echo "" > $log_file

#==============
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.zshrc > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -sf $dotfiles_dir/zshrc ~/.zshrc

#==============
# Set zsh as the default shell
#==============
sudo chsh $(whoami) -s /bin/zsh
sudo su - $(whoami)

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy"
rm $log_file
