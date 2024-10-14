#!/bin/sh

declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"
pomo_options["test"]="0.05"

case "$(uname -sr)" in

   Darwin*)
    alias wo="timer ${pomo_options["work"]}m && terminal-notifier -message 'Pomodoro'\
            -title 'Work Timer is up! Take a Break 😊'\
            -appIcon '~/.scripts/pomodoro/assets/pomodoro.png'\
            -sound Crystal"
        
    alias br="timer ${pomo_options["break"]}m && terminal-notifier -message 'Pomodoro'\
            -title 'Break is over! Get back to work 😬'\
            -appIcon '~/.scripts/pomodoro/assets/pomodoro.png'\
            -sound Crystal"
    alias test-pomodoro="timer ${pomo_options["test"]}m  && terminal-notifier -message 'Pomodoro'\
            -title 'Test ended!'\
            -appIcon '~/.scripts/pomodoro/assets/pomodoro.png'\
            -sound Crystal"
     ;;

   Linux*)
    
    function pomodoro() {
    if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
       val=$1
       echo $val | lolcat
       timer ${pomo_options["$val"]}m
       # spd-say "'$val' session done"
    
       if command -v play &>/dev/null; then
          play $HOME/.scripts/pomodoro/assets/pomodoro.mp3 &>/dev/null
       elif command -v ffplay &>/dev/null; then
	  ffplay -autoexit -t '5' $HOME/.scripts/pomodoro/assets/pomodoro.mp3 -nodisp -nostats -hide_banner
       else
          echo "Koniec"
       fi
    fi
    }

    alias wo="pomodoro 'work'"
    alias br="pomodoro 'break'"
    alias pomodoro-test="pomodoro 'test'"
    ;;

   *)
     echo 'Other OS' 
     ;;
esac

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
      wo
      br
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

