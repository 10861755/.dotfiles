#!/bin/sh
#
# Usage:
# 	Run the script to load dotfiles into the home directory.
# 	Run the script a second time to unload dotfiles.
#
# To make changes to the dotfiles directory structure:
#		1. Run this script so that changes are unloaded
#		2. Make changes to the dotfiles directory structure.
#		3. Run script again so that dotfiles are 'reloaded'.
#
#	Notes:
# 	- Do NOT move the script from the current directory ($src).
#		- Do NOT remove the backup dotfiles directory ($bkp)
#		- Do NOT remove the symlink in the home directory 
#			with the same name as this script.
#
# Description:
# 	This script makes all files contained in a 'source' directory 
# 	accessible from the home directory by symbolically linking them.
#
# 	When creating the links:
#		1. Backup files residing in the home directory to $bkp
#		2. Symlink everything in the $src directory to the home directory
# 	When 'undoing' the first run:
# 	1. Delete the links made from the $src directory
# 	2. Restore the original files from the $bkp directory

src=$HOME/.dotfiles							# Source Directory
bkp=$HOME/.dotfiles_backup			# Backup Directory 
cd $src
files=`ls -A`										# Files/Directories to symlink/remove

# Check if links exist; remove them and restore original files
if [ -L $HOME/$(basename $0) ]
then

	# Remove symlinks 
	for file in $files; do
		rm $HOME/$file
	done

	cd $bkp
	files=`ls -A`									# Files/Directories to restore

	# Copy original files back into home directory
	for file in $files; do
		mv $bkp/$file $HOME/$file 
	done

	# Remove backup directory
	rm -r $bkp

	echo "Dotfiles unloaded: Symlinks removed, original files restored."

# Links dont exist, backup files residing in the home directory, 
#	then create new symlinks from the source to the home directory
else

	# Create backup directory
	mkdir $bkp

	for file in $files; do

		# Check file exists in home directory before backing it up
		if [ -e $HOME/$file ]
		then 
			mv $HOME/$file $bkp/$file
		fi

		# Create the symbolic link
		ln -s $src/$file $HOME/$file

	done

	echo "Dotfiles loaded: Original files backed up and Symlinks made."

fi
