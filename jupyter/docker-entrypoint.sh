#!/bin/bash

sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm/slurm.conf

sudo service munge start
sudo service ssh start

source ./venv/bin/activate

jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''

tail -f /dev/null
