#!/bin/bash
# general updates
sudo apt-get update
sudo apt-get upgrade
# download required packages
sudo apt-get install -y \
  git python3 python3-pip python3-venv

# create python venv
python3 -m venv .venv
source .venv/bin/activate

# download required python packages
if [ ! -f requirements.txt ]; then
  pip3 install \
    RPi.GPIO opencv-python
  pip3 freeze > requirements.txt
else
  pip3 install -r requirements.txt
fi