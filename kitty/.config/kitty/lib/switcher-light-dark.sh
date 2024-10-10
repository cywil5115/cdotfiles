#!/usr/bin/env bash

# Kitty config location
KITTY_CONFIG_DIRECTORY=~/.config/kitty

test () {

  echo "Dark Theme Location:"
  echo $FILE1
  echo "Light Theme Location:"
  echo $FILE2
  echo "Current Theme Location:"
  echo $current_theme
  echo "Kitty Config Location:"
  echo $KITTY_CONFIG_DIRECTORY
  echo "Bundle Location:"
  echo $bundle
  echo "Bundle Name:"
  echo $bundle_name

}
# Current bundle file location
current_bundle=$KITTY_CONFIG_DIRECTORY/mode/current-bundle.txt

#Bundle_Name
if [[ "$*" == *"switch"*  ]]; then
  bundle_name=$(ls $KITTY_CONFIG_DIRECTORY/mode/ | grep -v "current-bundle.txt" | fzf --height=~15% --border=double)
else
  bundle_name=$('cat' $current_bundle)
fi

#Bundle_Location
bundle=$KITTY_CONFIG_DIRECTORY/mode/$bundle_name

#Dark Theme File
FILE1=$bundle/dark.conf

#Light Theme File
FILE2=$bundle/light.conf

current_theme=$KITTY_CONFIG_DIRECTORY/current-theme.conf

switch-to-new-bundle () {

  mode=$(ls $KITTY_CONFIG_DIRECTORY/mode/$bundle_name/ | fzf --height=~15% --border=double)

  if [[ "$FILE2" == "$bundle/$mode" ]] ; then
    echo "Here comes the light!"
    sleep 1
    'cat' $FILE2 > $current_theme
  else 
    echo "Into the dark side!"
    sleep 1
    'cat' $FILE1 > $current_theme
  fi

  'echo' $bundle_name > $current_bundle
}

switch-themes () {
  if cmp --silent -- "$FILE1" "$current_theme"; then
    echo "Here comes the light!"
    sleep 1
    'cat' $FILE2 > $current_theme
  else cmp --silent -- "$FILE2" "$current_theme"
    echo "Into the dark side!"
    sleep 1
    'cat' $FILE1 > $current_theme
  fi

  'echo' $bundle_name > $current_bundle

}

skipline () {
	echo " "
}

echo-help () {
 echo "TODO MAN"
}

echo-current () {
 'cat' $current_bundle
}

message () {
 skipline
 echo -e "  \033[1;30m[\033[1;32mi\033[1;30m]\033[0m Done."
 # echo "[i] Done."
 skipline
 echo "Press Ctrl+Shift+F5 to reload or reopen kitty"
}


# Main
if [[ "$*" == *"switch"* ]]; then
 switch-to-new-bundle 
 message
elif [[ "$*" == *"help"* ]]; then
 echo-help
elif [[ "$*" == *"current"* ]]; then
 echo-current
else
 switch-themes
 message
fi
#testing
if [[ "$*" == *"test"* ]]; then
  test
fi

#sleep 3
