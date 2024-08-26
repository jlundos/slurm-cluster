#!/bin/bash

# Set CPUs etc in slurm.conf - the same for all docker containers
sudo /etc/slurm/dockerhelp/fix_cpu_in_slurmconf.sh

# Copy munge.key stored by slurmmaster
sudo cp -a -f ~admin/shared/mungesetup/munge.key /etc/munge/munge.key

sudo service munge start
sudo service ssh start

source ./venv/bin/activate

jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password=''

tail -f /dev/null
