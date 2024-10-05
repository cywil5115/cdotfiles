#!/usr/bin/env bash

kitty-choose-theme () {
	chosen_theme=$(ls ~/.config/kitty/ |grep -v 'lib' | grep -v "kitty*" | grep -v "options.conf" | grep -v "current-theme.conf" )
	if [ ! -d ~/.config/kitty/$chosen_theme ]; then
	  'cat' ~/.config/kitty/$chosen_theme > ~/.config/kitty/current-theme.conf 
	  if [ ! $chosen_theme == '*.sh' ]; then
		  rm ~/.config/kitty/$chosen_theme
		fi
	fi
}

rename-file () {
	for file in ~/.config/kitty/*
	do
	  if [ -d "$file" ]; then
	    continue
	  else
			newname=`echo $file | sed -e 's/ /_/g'` 
		  mv "$file" "$newname" 
	  fi
	done
}

backup-config () {
	if [ ! -f "~/.config/kitty/options.conf" ]; then
		touch ~/.config/kitty/options.conf
	fi	
	if [ ! -f "~/.config/kitty/kitty-config" ]; then
		touch ~/.config/kitty/kitty-config
	fi
	'cat' ~/.config/kitty/kitty.conf > ~/.config/kitty/kitty-config 
}

 write-config-from-backup () {
	'cat' ~/.config/kitty/kitty-config > ~/.config/kitty/kitty.conf
	rm ~/.config/kitty/kitty-config
}

skipline () {
	echo " "
}

# Main
echo "After you select, press P"
sleep 3
backup-config
kitty +kitten themes
sleep 1
rename-file

kitty-choose-theme

write-config-from-backup
skipline
echo -e "  \033[1;30m[\033[1;32mi\033[1;30m]\033[0m Done."
# echo "[i] Done."
skipline
echo "Press Ctrl+Shift+F5 to reload or reopen kitty"
