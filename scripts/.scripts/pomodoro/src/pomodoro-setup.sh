#!usr/bin/env sh

# https://github.com/caarlos0/timer

if command -v brew &> /dev/null; then
  if ! command -v timer &> /dev/null; then
    brew install caarlos0/tap/timer
  fi
fi

source $HOME/.scripts/pomodoro/src/defaults.sh

# declare -A pomo_options
# pomo_options["work"]="45"
# pomo_options["break"]="10"
# pomo_options["test"]="0.05"

function pomodoro() {
if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
   val=$1
   if command -v lolcat &>/dev/null; then	      
     echo $val | lolcat
   else
     echo $val 
   fi
   timer ${pomo_options["$val"]}m
   # spd-say "'$val' session done"

   if command -v play &>/dev/null; then
      play $HOME/.scripts/pomodoro/assets/pomodoro.mp3 &>/dev/null
   elif command -v ffplay &>/dev/null; then
      ffplay -autoexit -t '5' $HOME/.scripts/pomodoro/assets/pomodoro.mp3 -nodisp -nostats -hide_banner &>/dev/null
   else
      echo "Koniec"
   fi
fi
}

alias pomodoro-test="pomodoro 'test'"

function start-pomodoro() {
  echo -n "How many rounds you want to do? "
  read count	  

  if [ -z $count ]; then
  # Default loops
    echo "Selected default option: 2"
    count=2
  fi

  for i in $(seq 1 $count); do
    if command -v lolcat &>/dev/null; then	      
      echo "Round: $i" | lolcat
    else
      echo "Round: $i"
    fi
    pomodoro 'work'
    pomodoro 'break'
  done
}

function change-pomo() {
  if [ -n "$1" ] && [ -n "$2" ]; then
     pomo_options["$1"]="$2"
     echo "The $1 time has been changed to $2 minutes"
  else
     echo "Please provide valid parameters: change_pomo [work/break] [time_in_minutes]"
  fi
}

function set-default-pomodoro(){
  
  defaults_file="$HOME/.scripts/pomodoro/src/defaults.sh"

  if [ -n "$1" ] && [ -n "$2" ]
  then  
    work=$1
    break=$2

    cat >"$defaults_file" <<EOF
    #!/bin/sh

    declare -A pomo_options
    pomo_options["work"]="$work"
    pomo_options["break"]="$break"
    pomo_options["test"]="0.05"

EOF

  echo "Please restart terminal to set default pomodoro"

  else
    echo "Usage: set-default-pomodoro [work time in minutes] [break time in minutes]"
  fi
}
