#!/bin/bash
# general updates
sudo apt-get update
sudo apt-get upgrade
# download required packages
sudo apt-get install -y \
  git python3.10 python3-pip python3-venv cmake wget build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev liblzma-dev

# build and install python3.9 (3.11 is bookworm minimum prebuilt and super gradients needs 3.7-9)
wget https://www.python.org/ftp/python/3.9.19/Python-3.9.19.tgz
tar xvf Python-3.9.19.tgz
cd Python-3.9.19/
./configure --enable-optimizations
sudo make altinstall
cd ..

# create python venv
python3.9 -m venv .venv
source .venv/bin/activate

# download required python packages
if [ ! -f requirements.txt ]; then
  # newer versions of specified don't work on the pi
  pip3 install \
    RPi.GPIO cython opencv-python-headless super-gradients torch==2.3.1 torchvision==0.18.1 matplotlib==3.5.2
  pip3 freeze > requirements.txt
else
  pip3 install -r requirements.txt
fi