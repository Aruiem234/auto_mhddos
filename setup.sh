#!/bin/bash

sudo apt update -y
sudo apt upgrade -y
# Install git, python3
sudo apt install --upgrade git wget python3 python3-pip screen curl gcc libc-dev libffi-dev libssl-dev python3-dev rustc -y


#Install latest version of mhddos_proxy and MHDDoS
cd ~
sudo rm -r mhddos_proxy
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
cd mhddos_proxy
sudo rm proxies_config.json
curl -o proxies_config.json https://raw.githubusercontent.com/Aruiem234/mhddosproxy/main/proxies_config.json
sudo git clone https://github.com/MHProDev/MHDDoS.git
sudo python3 -m pip install -r MHDDoS/requirements.txt
cd ~
